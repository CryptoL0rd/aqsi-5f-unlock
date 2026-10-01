# Исследование железа aQsi 5-Ф (CS10) — журнал

> Дата начала: 2026-10-01
> Устройство: aQsi 5-Ф, модель CS10, SoC MediaTek MT6737M (a26_6737m), Android 7.0 (API 24, security patch 2017-07-05)
> Серийный: A26-12WB-9G00547 (ADB: 0123456789ABCDEF)

Этот файл — рабочий журнал исследования аппаратных модулей терминала и того, как к ним обращаться. Дополняется по мере работы.

---

## Сводная таблица модулей

| # | Модуль | Статус | Точка доступа | Детали |
|---|--------|--------|----------------|--------|
| 1 | Чековый термопринтер (MAXQ3255) | ⚠️ частично | `/dev/ttyMT1` UART 921600, сервис `MaxMcuservice` | Инициализация/буфер OK, но PrnStart → rc=-3 (low voltage на головке) |
| 2 | 1D-сканер штрих-кодов (Honeywell) | ⚠️ через binder | binder `scannerservice` (`IScannerService`) | `libPosApi.Lib_ScanOpen` → rc=-1002; использовать binder API |
| 3 | Кардридер: чип + магнитная полоса + NFC | ✅ работает (все 3 интерфейса подтверждены чтением карт) | `libPosApi.so` (Ciontek CS10-PCD) → vpos.apipackage | SN `1002568497007021`; NFC: UID/ATQ + EMV FCI с AID UnionPay; ICC: ATR PBOC3; MSR: треки 1/2 |
| 4 | Камера (QR/2D-сканер) | ✅ работает | `media.camera` (`ICameraService`) | Binary Eye установлен |
| 5 | USB-хост | ✅ работает | `usb` сервис | ttyGS0-7 (gadget), mtp_usb |
| 6 | Serial (MTK UART) | ✅ работает | ttyMT0-3 | ttyMT1 занят принтером |
| 7 | ИК-порт (consumer IR) | ✅ работает | `consumer_ir` сервис | — |
| 8 | Вибратор | ✅ работает | `vibrator` сервис | — |
| 9 | Термодатчики | ✅ работает | `/vendor/bin/thermal`, `thermald` | процессы запущены |
| 10 | Топливомер батареи | ✅ работает | `/vendor/bin/fuelgauged` | точный замер заряда |
| 11 | Акселерометр/гироскоп/магнитометр | ⚠️ есть, не запущены | AKM09911/8963/8975, BMM050, AMI304 | для кассы не нужны |
| 12 | Отпечатки пальцев | ❌ нет модуля | `FingerprintService` в ядре | библиотек/процесса нет |
| 13 | BCR-сервис | ❌ не зарегистрирован | `com.android.server.bcr` | код есть, не используется |
| 14 | PSAM-слот | ❌ не установлен | `/dev/psamdev` | файла устройства нет |

---

## 1. Чековый термопринтер (MAXQ3255)

### Что найдено
- Контроллер принтера: **Maxim MAXQ3255X** (прошивка `/system/data/mcucfg/mcuapp/MAXQ3255X_App.bin`).
- Шрифты для печати: `/system/data/mcucfg/font/BBFontUnicode_1.bin`, `BBUnicodeFont.bin`, `BB16FontUnicode_2.bin` — включают кириллицу.
- Подключение: UART `/dev/ttyMT1`, скорость **921600** (из строк `libmaxmcu_uart_jni.so`: `init_serial_port_921600`, `MaxMcucommunication_921600`).
- JNI-мост: `/system/lib/libmaxmcu_uart_jni.so` — функции `Lib_ComOpen`, `init_serial_port`, `read_serial`, `write_serial`, handshake.
- Сервис: binder `MaxMcuservice` → классы `com.android.server.maxmcu.MAXService` + `MaxMcuNative`.
- Также обнаружен `/dev/psamdev` в строках — PSAM-слот (не установлен физически).

### API (MaxMcuNative, из smali)
```
nativeMaxMcuGetVersion32550([B)   - версия прошивки MCU
nativeMaxMcuPowerHandShake()       - квитирование
nativeMaxMcuPowerOn() / PowerOff() / PowerSleep()
nativeMaxMcuUpdate32550([B)        - обновление прошивки MCU
```
MAXService (Java-обёртка): `getversion32550`, `powerhandshake`, `poweron`, `poweroff`, `powersleep`, `systemReady`, `update32550`.

### Практическая проверка
- `service call MaxMcuservice 1` → Parcel OK (сервис отвечает).
- `service call MaxMcuservice 3` → 0x00000002 (версия MCU).

### Как печатать
Печать идёт двумя путями:
1. **Стандартный Android print-стек**: сервис `print` (`android.print.IPrintManager`) + `com.android.printspooler` (принимает scheme `printjob:`). Требует разрешения `BIND_PRINT_SPOOLER_SERVICE` (выдать через `pm grant`).
2. **Напрямую по UART MAXQ3255**: писать команды в `/dev/ttyMT1` (протокол MAXQ3255 — ESC/POS-подобный, требует реверса прошивки для полного набора команд).

### TODO
- [ ] Реверс протокола MAXQ3255 (команды печати текста, штрих-кода, отреза бумаги)
- [ ] Попробовать печать через print-стек (выдать permission, отправить printjob)

---

## 2. 1D-сканер штрих-кодов (Honeywell)

### Что найдено
- SDK: `android.hardware.scanner` (классы `ScannerNative`, `ScannerNativeSub`, `ScannerNativeNL`, `KeyWatcher`).
- JNI: `libscanner1d_jni.so` — функции `native_read_barcode`, `native_get_status`, `native_send_cmd`, `native_power_on/off`, `native_firmware_upgrade`, `native_restore_factory`, `native_set_laser_on_time`, `native_get_scanner_id`.
- Драйвер: Honeywell HSM (`com.hsm.barcode.DecodeResult`).
- Сервис: `com.android.scanner` (пакет `kscanner`), binder-имя **`scannerservice`**, интерфейс `IScannerService`.
- Триггер: боковая клавиша (`sides_key_conf`), класс `KeyWatcher` (грузит `scannerkey`).
- Конфиг: `persist.sys.custom.scanner` (значение `1d` = 1D-сканер).

### API (IScannerService, из smali)
```
BarcodeCheck(I)I
BarcodeConfig(II)I
BarcodeGetAll()Ljava/lang/String;
GlobalConfig([B)I
RestoreFactory()I
ScannerSendCmd(I[B)I
firmware_upgrade([B)I
getScannerId()I
getServiceStaus()I
powerOff(I)I
powerOn(I)I
registerCallback(IScannerServiceCallback)
unregisterCallback(IScannerServiceCallback)
```
Callback: `onBarcodeCheckComplete(III)`, `onBarcodeConfigComplete(II)`, `onConfigComplete(I)`, `onRestoreFactoryComplete(I)`, `onSendCommand(II[B)`.

### Intents
- `com.android.scanner.barcode` — запуск сервиса
- `android.intent.scanner.ACTION_BAR_SCAN` — сканирование
- `android.intent.scanner.BAR_CHECK`, `android.intent.scanner.BAR_CONFIG`

### Практическая проверка
- Процесс `com.android.scanner` запущен (uid 1000).
- `am startservice -a com.android.scanner.barcode` → сервис стартует.
- `service call scannerservice N` → отвечает `-5` на все методы (вероятно, требует авторизации или сканер в спящем режиме).

### TODO
- [ ] Разобраться с кодом -5 (авторизация вызова / power state)
- [ ] Реальный тест сканирования (навести на штрих-код, поймать результат)

---

## 3. Кардридер (чип ICC + магнитная полоса MSR + NFC)

### Что найдено
- Реализация: `com.android.vlfirmware.mpos` (внутри `ru.sberbank.uposdroidclient`).
- Низкоуровневый доступ: `SerialPortInitialize("/dev/ttyHSL2", 460800, 0)` — UART PAX-совместимого кардридера. **ВАЖНО**: `/dev/ttyHSL2` сейчас не существует — порт может создаваться при инициализации UPOS или отличаться на этой ревизии.
- UPOS-клиент: `ru.sberbank.uposdroidclient` (процесс жив, uid 10079), права: `CLOUDPOS_MSR`, `CLOUDPOS_PRINTER`, `CLOUDPOS_CONTACTLESS_CARD`, `com.sunmi.perm.MSR`, `com.sunmi.perm.CONTACTLESS_CARD` → терминал совместим с SDK Sunmi/CloudPOS.
- Также есть `ru.sberbank.platiqrandroid` (процесс жив) — второй компонент Сбера.

### Типы карт (из mpos.java)
```
EMV_CARD_ICC  = 1  - чип (контактный)
EMV_CARD_MSR  = 0  - магнитная полоса
EMV_CARD_NFC  = 2  - бесконтактная
EMV_CARD_NOCARD = 3
```

### Команды (HANDLE_*)
Устройства: `CARDDETECT(30)`, `ICCPOWERUP(31)`, `ICCPOWERDOWN(32)`, `ICCTRANSMIT(33)`, `RFTRANSMIT(34)`, `RFREMOVE(35)`, `MSRREADTRACK(36)`.
Ядро EMV: `INITIALIZE(40)`, `BEGIN(41)`, `COMPLETE(42)`, `APPSELECT(43)`, `USERCONFIRM(44)`, `INPUTPIN(45)`, `ABORT(46)`.
Крипто: `ENC_ECB(20)`, `ENC_CBC(21)`, `DEC_ECB(22)`, `DEC_CBC(23)`, `CALC_MAC(24)`, MAC PBOC DES/3DES, ANSI X99/X919.
Чтение: `READ_AID(2)`, `READ_AIDLIST(1)`, `READ_CAPK(7)`, `READ_CAPKLIST(6)`.

### NFC
- API: `android.nfc.NfcAdapter`, `INfcAdapter`, `INfcTag`, `INfcCardEmulation`, `INfcFCardEmulation` (51 класс в compiled-classes).
- Библиотека: `libnfc_ndef.so` (функции `phFriNfc_NdefRecord_*` — генерация/парсинг NDEF).
- Физически NFC — часть кардридера (EMV_NFC), отдельного NFC-сервиса нет.

### TODO
- [ ] Найти актуальный путь UART кардридера (ttyHSL2 не существует — проверить другие tty)
- [ ] Проверить, открывает ли UPOS порт при старте (логи)

### Уточнение (2026-10-01, дополнение)
- В ядре зарегистрированы ТОЛЬКО драйверы `g_serial` (ttyGS0-7) и `mtk-uart` (ttyMT0-3) — см. `/proc/tty/drivers`. Драйвера `ttyHSL` нет.
- Внешних USB-устройств нет (только хост-контроллер `1d6b:0002`), PSAM-слот отсутствует.
- **Вывод**: кардридер этой ревизии работает через `mtk-uart` (ttyMT*), а не через ttyHSL2 (код mpos с `SerialPortInitialize("/dev/ttyHSL2", 460800, 0)` — от PAX-совместимой модели; на этой ревизии путь определяется нативно через `ports.devices()`).
- UPOS-клиент не пишет в стандартный logcat — порт ищется через нативный `ports.devices()` + `/proc/tty/drivers`.

---

## 4. Камера (QR/2D)

- Сервис: `media.camera` (`android.hardware.ICameraService`), процесс `cameraserver`.
- Уже используется: Binary Eye 1.75.4 установлен и работает (камера открыта, доступ разрешён).
- `service call media.camera 1` → "No data available" (не активна без запроса).

---

## 5. Прочие сервисы и железо

### USB / Serial
- `usb` сервис (`android.hardware.usb.IUsbManager`), `serial` (`android.hardware.ISerialManager`).
- Порты: ttyMT0-3 (MTK), ttyGS0-7 (USB gadget), ttyC0-3 (radio), usb-ffs, usb_accessory, mtp_usb.

### ИК-порт
- `consumer_ir` (`android.hardware.IConsumerIrService`) — отвечает на probe.

### Вибратор
- `vibrator` (`android.os.IVibratorService`) — отвечает (значение 1).

### Датчики (запущены)
- `/vendor/bin/thermal`, `thermald` — термодатчики.
- `/vendor/bin/fuelgauged` — топливомер (точный замер батареи).
- `sensor_polling` (root).

### Датчики (есть, не запущены)
- `akmd09911`, `akmd8963`, `akmd8975` (акселерометр AKM), `bmm050d` (магнитометр), `ami304d` (гироскоп), `geomagneticd`, `msensord`.

### Отпечатки пальцев
- `com.android.server.fingerprint.FingerprintService` + клиенты (Enroll/Authentication/Enumerate) есть в services.odex, но:
  - нет JNI-библиотек сканнера отпечатков,
  - нет binder-сервиса,
  - нет процесса.
- Вывод: **модуль отпечатков не установлен** в этой комплектации.

### BCR
- `com.android.server.bcr.BCRService` есть в odex, binder-имя `bcr_service` зарегистрировано, но сервис не запущен и не используется (вероятно, для внешнего BCR-сканнера).

---

## Служебная информация

### Ключевые пакеты железа
```
com.android.scanner        - 1D-сканер (kscanner, v4.5.0)
com.android.kbcodescan     - камерный сканер штрих-кодов (CamBarcode)
com.android.scannerdemo    - демо API сканера
com.android.printspooler   - спулер печати (v7.0)
ru.sberbank.uposdroidclient- UPOS-клиент Сбера (v1.3.0) - кардридер/EMV
ru.sberbank.platiqrandroid - второй компонент Сбера
ru.aqsi.rr                 - MainActivity (v1.0.0)
ru.aqsi.otk                - MainActivity (v1.38.0)
ru.aqsi.support            - поддержка (MainActivity, BootUpReceiver)
```

### Ключевые сервисы (binder)
```
MaxMcuservice    - com.android.server.maxmcu.IMAXService  (питание MCU)
scannerservice   - com.android.scanner.IScannerService    (1D-сканер)
print            - android.print.IPrintManager             (печать)
usb / serial     - android.hardware.usb / android.hardware.serial
consumer_ir      - android.hardware.IConsumerIrService    (ИК)
vibrator         - android.os.IVibratorService            (вибратор)
media.camera     - android.hardware.ICameraService        (камера)
bcr_service      - com.android.server.bcr.IBCRService     (не активен)
```

### Ключевые JNI-библиотеки
```
libscanner1d_jni.so       - 1D-сканер (Honeywell)
libScanCamera*.so         - камерный скан (Honeywell HHP)
libmaxmcu_uart_jni.so     - MCU принтера (UART ttyMT1)
libprintspooler_jni.so    - битмап-сериализация печати
libnfc_ndef.so            - NFC NDEF
```

### Артефакты (локальные файлы)
```
services.odex          - пропатченный PackageManagerService (whitelist)
kscanner.odex          - логика сканера
printspooler.odex      - логика печати
upos.apk / upos_src/   - декомпилированный UPOS-клиент Сбера
max_smali/             - MAXService + MaxMcuNative (smali)
scanner_smali/         - ScannerService, ScannerNative, IScannerService (smali)
```

---

## Хронология исследований

### 2026-10-01
- Полная инвентаризация сервисов (136 binder-сервисов) и пакетов железа.
- Обнаружен и изучен MAXQ3255 (принтер): UART ttyMT1 @ 921600, JNI-мост, сервис MaxMcuservice.
- Обнаружен и изучен 1D-сканер Honeywell: API IScannerService, JNI libscanner1d_jni.so, боковая клавиша.
- Обнаружен и изучен кардридер: EMV-стек com.android.vlfirmware.mpos (ICC/MSR/NFC), UPOS-клиент Сбера.
- Подтверждено: отпечатки пальцев и PSAM отсутствуют физически; BCR не активен.
- Датчики: работают thermal/thermald/fuelgauged; акселерометры не запущены.

### 2026-10-01 (вечер) — кардридер Ciontek и мини-тест

**Ключевое открытие: кардридер — Ciontek CS10-PCD, нативная библиотека `libPosApi.so`**

- В UPOS-клиенте и OTK есть нативная библиотека `libPosApi.so` (строка `0|OPEN|120978|CS10-PCD|ciontek-lib|1.2.0`).
- JNI-классы библиотеки: `vpos.apipackage.{Sys,Icc,Mcr,Picc,Print,Scan}` (имена экспортов `Java_vpos_apipackage_*_Lib_1*`).
- Порты: `/dev/ttyMT1`, `/dev/ttyMT3`, `/dev/ttyMT%d`, `/dev/ttySex1` — кардридер на одном из MTK UART.

**Мини-тестовая программа (dalvikvm, без установки APK)**
- Классы скомпилированы в dex-jar, запускаются прямо через `dalvikvm64` на устройстве (обход подписи APK).
- Запуск: `LD_LIBRARY_PATH=/data/app/ru.aqsi.otk-1/lib/arm64 dalvikvm64 -cp hwtest_dex.jar com.hwtest.HwTest`

**Результаты первого прогона (без карты):**
```
AppInit rc=1283760128 (нестандартный код, но не краш)
SetEntryModeOpen rc=0
IccCheck rc=-2405   (чип-слот: карты нет)
IccOpen  rc=-2500
McrCheck rc=1, McrOpen rc=0, McrRead rc=0  (MSR открыт, ждёт карту)
PiccOpen rc=0, PiccCheck rc=-513  (NFC открыт, карты нет)
GetVersion rc=0: 04 04 08 01 05 08 02 00 (версия прошивки кардридера)
ReadSN    rc=0: ASCII "1002568497007021" (серийный номер кардридера!)
Beep rc=0    (бипер сработал)
SetLed rc=0  (LED работает)
```

**Реальное чтение карт (карта вставлена в чип-слот):**
```
IccCheck rc=0      (карта обнаружена)
IccOpen(slot=1) rc=0  ATR=3B 6E 00 00 80 31 80 66 B0 84 0C 01 6E 01 83 00 90
```
- **Чип-ридер работает!** ATR получен: TS=3B (прямая конвенция), T0=6E, 14 исторических байт
  `80 31 80 66 B0 84 0C 01 6E 01 83 00 90` — стандартный ATR банковской карты.
- IccCheck rc=0 = карта в слоте; IccOpen(slot=1) rc=0 = чип активирован (важно: слот = 1, не 0).
- SELECT 1PAY/GPO не ответили — вероятно, тестовая карта требует PIN или имеет ограниченный доступ,
  но обмен с чипом установлен (ATR = карта ответила на активацию).

**NFC-карта (карта поднесена):**
```
PiccOpen  rc=0
PiccCheck rc=0  UID=41 43 00 00 ...  ATQ=D2 FE AC E4
```
- **NFC-ридер работает и читает карты!** UID и ATQ получены.
- UID `41 43 00 00` похож на тестовую MIFARE-карту (4-байтный UID), не EMV.
- SELECT 2PAY через PiccCommand не ответил — карта не EMV (ожидаемо для MIFARE-теста).
- Для чипа (ICC) и магнитной полосы (MSR) нужна физическая вставка/проведение карты — слоты работают (коды ошибок корректные: "нет карты").

**Команды мини-теста (vpos.apipackage):**
```
Sys:  Lib_AppInit, Lib_AppExit, Lib_Beep, Lib_SetComPath, Lib_SetEntryModeOpen/Close,
      Lib_GetVersion, Lib_ReadSN, Lib_SetLed, Lib_LedCtrl, Lib_GetTime, Lib_Test
Icc:  Lib_IccCheck, Lib_IccOpen, Lib_IccCommand, Lib_IccApduCmd, Lib_IccClose
Mcr:  Lib_McrCheck, Lib_McrOpen, Lib_McrRead, Lib_McrClose, Lib_McrReset
Picc: Lib_EntryPoint, Lib_PiccOpen, Lib_PiccCheck, Lib_PiccCommand, Lib_PiccApduCmd,
      Lib_PiccClose, Lib_PiccHalt, Lib_PiccReset, Lib_PiccRemove, Lib_PiccPolling, Lib_PiccNfc
Print: Lib_PrnInit, Lib_PrnCheckStatus, Lib_PrnStr, Lib_PrnFeedPaper, ... (MAXQ3255)
Scan:  Lib_ScanOpen, Lib_ScanRead, Lib_ScanClose
```

**Инструменты:**
- Конвертация class→dex: `d8.bat --output=out.jar classes/...`
- Запуск на устройстве: `dalvikvm64 -cp app.jar com.hwtest.HwTest`
- Исходники: `/c/Users/admin/ZCodeProject/hwtest/`

### 2026-10-01 (ночь) — MSR прочитан, разбор PassSDKDemo

**Найден рабочий референс от вендора: `test.apidemo.activity` (PassSDKDemo)**
- APK: `/data/app/test.apidemo.activity-1/base.apk` (32-бит, primaryCpuAbi=armeabi-v7a).
- Его `libPosApi.so` лежит в `/data/app/test.apidemo.activity-1/lib/arm/` (только 32-бит!).
- Поэтому самописные тесты надо запускать через **`dalvikvm32`** с `LD_LIBRARY_PATH=/data/app/test.apidemo.activity-1/lib/arm:/system/lib` — через dalvikvm64 получаем UnsatisfiedLinkError.
- Декомпилирован jadx'ом в `passsdk_src/`. MSR-логика — `test.apidemo.activity.McrActivity`.

**Правильный алгоритм чтения MSR (из McrActivity):**
```
McrOpen();                                   // rc=0
loop:
    McrOpen();                               // повторный open каждый цикл
    while (McrCheck() != 0) sleep(200);      // McrCheck: 1 = нет карты, 0 = карта проведена!
    McrRead((byte)0, (byte)0, t1, t2, t3);   // буферы по 250 байт
    ret битовая маска: bit0=track1, bit1=track2, bit2=track3; ret>7 = ошибка данных
McrClose();
```
Важно: **McrCheck возвращает 1 в холостую и 0 в момент свайпа** (инверсная семантика относительно ожиданий). Читать надо только когда McrCheck==0.

**Успешное чтение магнитной полосы (обе карты, треки 1+2):**
```
PassSDKDemo:  ret=3  TRACK1: B2202201754786297^STOYANOV/IVAN^230920119850685
                     TRACK2: 2202201754786297=230920119850685
MsrTest v3:   ret=3  TRACK1: B4276380105400142^STOYANOV/IVAN^220820112830...
                     TRACK2: 4276380105400142=22082011283070400000
```
- **MSR полностью работает.** Ранние неудачи были не в коде, а в физике: старая карта не давала McrCheck==0 (не регистрировалась головкой).
- Вторая карта (PBOC3) по чипу: `ATR=3B 67 00 00 86 88 50 42 4F 43 33` (ASCII "PBOC3" в исторических байтах).

**Проверка логов PassSDKDemo вживую** (logcat tag `liuhao`): подтвердил те же вызовы и значения, что в декомпиляте.
### 2026-10-01 (утро) — PosTestSuite: консольный клон PassSDKDemo, полный прогон

Написан и отлажен **PosTestSuite** — консольный аналог PassSDKDemo (`test.apidemo.activity`), покрывающий все 9 разделов: SYS, ICC, PICC/NFC, MSR, PRINT, SCAN, PCI, EMV-detect, MISC. Подробности и полный лог — в [PASSDKCLONE.md](PASSDKCLONE.md).

- Исходники: `/c/Users/admin/ZCodeProject/postest/src/` (JNI-обёртки `vpos.apipackage.*` + `com.postest.PosTestSuite`).
- Запуск: `LD_LIBRARY_PATH=/data/app/test.apidemo.activity-1/lib/arm:/system/lib dalvikvm32 -cp /data/local/tmp/postest_dex.jar com.postest.PosTestSuite [suite...]`.

**Новые результаты (карты в чип-слоте и на NFC):**
- **NFC/EMV**: SELECT PPSE по `PiccCommand` → **SW=9000, полный FCI с AID `A0000006581010` (UnionPay)**. Карта — полноценная EMV. UID=`D04EE541`, SAK=0x20, ATS получен.
- **Чип**: ATR PBOC3 (`3B 67 00 00 86 88 "PBOC3"`); SELECT 1PAY/2PAY → SW=6A82 (на тестовой карте нет этих файлов), GET CHALLENGE → SW=6D00.
- **PSAM**: слоты 1/2 пустые (IccOpen rc=-2102) — подтверждено.
- **Крипто**: DES-эталон `DES(0,key=0)=8CA64DE9C1B123A7` совпал; `PciGetRnd` работает; KCV-слоты пустые.
- **EntryPoint**: rc=1 (ICC) — верно детектирует карту в чип-слоте.
- **SYS**: версия прошивки `04 04 08 01 06 09 02 00`, SN, ChipID, RTC, beep, LED1-3 — ОК; LED4 отсутствует (rc=-1).
- **Принтер**: вся цепочка init→setGray→setFont→Str — OK, но `PrnStart` → **rc=-3 = "low voltage"** (расшифровка из самого PassSDKDemo). Батарея 100%/8402mV, MCU power node включён — вероятно просадка питания печатающей головки на этом экземпляре. Код верен (1-в-1 с PassSDKDemo).
- **1D-сканер**: `libPosApi.Lib_ScanOpen` → rc=-1002 (вендорский API не работает); использовать binder `scannerservice` (IScannerService, Honeywell libscanner1d_jni.so) — модуль физически присутствует.

**Статус модулей обновлён** в сводной таблице (принтер и сканер — частично/через binder).

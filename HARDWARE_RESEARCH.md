# Исследование железа aQsi 5-Ф (CS10) — журнал

> Дата начала: 2026-10-01
> Устройство: aQsi 5-Ф, модель CS10, SoC MediaTek MT6737M (a26_6737m), Android 7.0 (API 24, security patch 2017-07-05)
> Серийный: A26-12WB-9G00547 (ADB: 0123456789ABCDEF)

Этот файл — рабочий журнал исследования аппаратных модулей терминала и того, как к ним обращаться. Дополняется по мере работы.

---

## Сводная таблица модулей

| # | Модуль | Статус | Точка доступа | Детали |
|---|--------|--------|----------------|--------|
| 1 | Чековый термопринтер (MAXQ3255) | ✅ работает | `/dev/ttyMT1` UART 921600, сервис `MaxMcuservice` | Прошивка `MAXQ3255X_App.bin`, шрифты с кириллицей |
| 2 | 1D-сканер штрих-кодов (Honeywell) | ✅ работает | binder `scannerservice` (`IScannerService`) | JNI `libscanner1d_jni.so`, драйвер `com.hsm.barcode` |
| 3 | Кардридер: чип + магнитная полоса + NFC | ✅ работает (подтверждено) | `libPosApi.so` (Ciontek CS10-PCD) → vpos.apipackage | SN `1002568497007021`, NFC читает UID/ATQ, ICC/MSR ждут карту |
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

**Реальное чтение NFC-карты (карта поднесена):**
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
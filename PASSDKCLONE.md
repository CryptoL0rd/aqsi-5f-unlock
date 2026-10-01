# PosTestSuite — консольный клон PassSDKDemo для aQsi 5-Ф

> Дата: 2026-10-01
> Устройство: aQsi 5-Ф / Ciontek CS10-PCD (MT6737M, Android 7.0, 32-bit libPosApi.so)
> Референс: `test.apidemo.activity` (PassSDKDemo от вендора Ciontek)

Это документация по **PosTestSuite** — самописной консольной замене PassSDKDemo, покрывающей все его функции. Приложение работает **без установки APK**, через прямой запуск dex-jar'а на `dalvikvm32` с нативной библиотекой `libPosApi.so` из каталога PassSDKDemo.

---

## 1. Зачем

PassSDKDemo (`test.apidemo.activity`) — GUI-приложение Ciontek с 9 пунктами меню:
`ICC`, `NFC`, `MCR`, `PCI`, `Print`, `Sys`, `Scan`, `Upgrade OS`, `Emv`.

Оно требует тапов по экрану. Для автоматизации, регрессионных тестов и работы по ADB без экрана нужен консольный аналог, вызывающий те же `vpos.apipackage.*` JNI-функции.

---

## 2. Что покрыто (соответствие PassSDKDemo)

| PassSDKDemo activity | Метод PosTestSuite | JNI-вызовы |
|----------------------|--------------------|------------|
| SysActivity | `suiteSys()` | `Lib_GetVersion`, `Lib_ReadSN`, `Lib_ReadChipID`, `Lib_GetTime`, `Lib_Beep`, `Lib_LedCtrl`, `Lib_SecuTamperBit` |
| IccActivity | `suiteIcc()` | `Lib_IccCheck/Open/Command/ApduCmd/Close` + PSAM detect (slots 1/2) |
| PiccActivity | `suitePicc()` | `Lib_PiccOpen/Check/Polling/Nfc/Command/Reset/Halt/Remove/Close`, `Lib_PiccM1Authority/ReadBlock`, `Lib_PiccMfulActivateCard/Read` |
| McrActivity | `suiteMsr()` | `Lib_McrOpen/Check/Read/Close` (алгоритм 1-в-1 из PassSDKDemo) |
| PrintActivity | `suitePrint()` | `Lib_PrnInit/CheckStatus/SetGray/SetFont/SetAlign/Str/Start/FeedPaper/Close` |
| ScanActivity | `suiteScan()` | `Lib_ScanOpen/Read/Close` (+ примечание про binder `scannerservice`) |
| PciActivity | `suitePci()` | `Lib_PciGetRnd`, `Lib_PciReadKcv`, `Lib_Des` (read-only, без записи ключей) |
| EmvTestActivity | `suiteEmvDetect()` | `Lib_EntryPoint` + ручной опрос ICC/MSR |
| (инвентарь) | `suiteMisc()` | `Test_uarts` |

Не реализовано сознательно:
- **UpgradeOsActivity** — обновление прошивки (`Lib_Update`, `Lib_UpdateBoot`). Опасно, без необходимости не трогаем.
- **PciWritePIN/MAC/DES keys** — запись ключей в защищённое хранилище. Изменяет состояние устройства, в тестовом клоне только чтение (`GetRnd`, `ReadKcv`, `Des`).

---

## 3. Архитектура

```
postest/
├── src/
│   ├── vpos/apipackage/     # JNI-обёртки (точные сигнатуры из декомпиля PassSDKDemo)
│   │   ├── Sys.java
│   │   ├── Icc.java
│   │   ├── Mcr.java
│   │   ├── Picc.java
│   │   ├── Print.java
│   │   ├── Scan.java
│   │   ├── Pci.java
│   │   ├── APDU_SEND.java   # 520-байтный APDU-контейнер (совместим с PassSDKDemo)
│   │   └── APDU_RESP.java   # 516-байтный APDU-парсер
│   └── com/postest/
│       └── PosTestSuite.java  # главный класс со всеми suite
└── postest_dex.jar          # собранный dex (результат d8)
```

Ключевые особенности:
- **Без Android framework**: только `java.lang` + `java.util`. Не использует `android.content.Context`, поэтому не требует `Lib_AppInit(Context)` — работает сигнатура `Lib_AppInit()`.
- **32-бит**: `libPosApi.so` на устройстве только `armeabi-v7a` → запускать через `dalvikvm32`, иначе `UnsatisfiedLinkError`.
- **Без установки**: запуск через `dalvikvm32 -cp app.jar com.postest.PosTestSuite` с `LD_LIBRARY_PATH` на каталог с `.so`.

---

## 4. Сборка и запуск

### Сборка (на хосте)

```bash
cd /c/Users/admin/ZCodeProject/postest
rm -rf out && mkdir -p out

# 1. Компилируем .class
javac -encoding UTF-8 -d out \
  src/vpos/apipackage/*.java \
  src/com/postest/PosTestSuite.java

# 2. Конвертируем .class → .dex (jar)
/c/Users/admin/scoop/persist/android-clt/build-tools/34.0.0/d8.bat \
  --output=postest_dex.jar \
  out/com/postest/*.class \
  out/vpos/apipackage/*.class

# 3. Пушим на устройство
MSYS_NO_PATHCONV=1 adb push postest_dex.jar //data/local/tmp/postest_dex.jar
```

### Запуск (на терминале через ADB)

```bash
# Все неинтерактивные сьюты (MSR/SCAN только open+check)
MSYS_NO_PATHCONV=1 adb shell \
  "LD_LIBRARY_PATH=/data/app/test.apidemo.activity-1/lib/arm:/system/lib \
   dalvikvm32 -cp /data/local/tmp/postest_dex.jar com.postest.PosTestSuite"

# Только выбранные сьюты
... PosTestSuite icc picc        # чип + NFC
... PosTestSuite print           # только принтер
... PosTestSuite sys pci         # система + крипто

# Интерактивный режим (MSR ждёт свайп 60с, SCAN ждёт штрих-код 10с)
... PosTestSuite msr scan wait
```

### Что в `LD_LIBRARY_PATH`

`/data/app/test.apidemo.activity-1/lib/arm` — это каталог, куда Android распаковал нативные библиотеки PassSDKDemo:
- `libPosApi.so` — основная (кардридер/принтер/сканер/система)
- `libPosApi_callback.so`
- `libPaypassApi.so`, `libVisaLib.so` — EMV-ядра

---

## 5. Результаты прогона 2026-10-01 (карты в слоте + на NFC)

### ✅ SYS — все функции
```
Lib_GetVersion rc=0  raw=04 04 08 01 06 09 02 00 '849'
Lib_ReadSN     rc=0  SN=1002568497007021
Lib_ReadChipID rc=0  B26701220C08F74F00072A7D9E784D31
Lib_GetTime    rc=0  05001219254300 (BCD: 26-10-01 04:53)
Lib_Beep       rc=0
Lib_LedCtrl    rc=0  (LED1-3 OK, LED4 rc=-1 — нет физически)
```

### ✅ ICC — чип-карта прочитана (PBOC3)
```
IccCheck(slot=0)  rc=0  (карта есть)
IccOpen(0,1)      rc=0  ATR=0B 3B 67 00 00 86 88 50 42 4F 43 33
                          ^ASCII "PBOC3" в исторических байтах
SELECT 1PAY.SYS.DDF01  SW=6A82 (файл не найден — ожидаемо для тестовой карты)
SELECT 2PAY.SYS.DDF01  SW=6A82
GET CHALLENGE          SW=6D00 (INS не поддерживается — норма для PBOC)
PSAM slot1/2           rc=-2102 (пусто, как и ожидалось — PSAM не установлен)
```

### ✅ PICC/NFC — карта отвечает, EMV FCI получен
```
PiccOpen       rc=0
PiccCheck 'A'  rc=0  SN=D04EE541
PiccPolling    rc=0  CardType=AC UID=D04EE541 SAK=20
                     ATS=147880750257694C4C55000B0000000020220128
PiccCommand SELECT 2PAY.SYS.DDF01 → SW=9000, FCI:
  6F23 840E 325041592E5359532E4444463031   ("2PAY.SYS.DDF01")
       A511 BF0C0E 610C
                  4F07 A0000006581010      ← AID UnionPay
                  870101
```
Это **полноценный EMV-ответ** платёжной карты: приложение PPSE найдено, AID `A0000006581010` (China UnionPay).

### ✅ MSR — модуль рабочий (open/check OK, свайп-флоу проверен ранее)
```
McrOpen  rc=0
McrCheck rc=1  (idle, ждёт свайп)
```
Свайп-флоу (алгоритм PassSDKDemo) подтверждён ранее двумя картами:
```
ret=3  TRACK1: B4276380105400142^STOYANOV/IVAN^220820112830...
       TRACK2: 4276380105400142=22082011283070400000
```

### ⚠️ PRINTER — инициализация OK, но low voltage на головке
```
PrnInit        rc=0
PrnSetGray     rc=0
PrnSetFont     rc=0
PrnStr(...)    rc=0   (все строки буферизуются)
PrnStart       rc=-3  [Low voltage]
PrnCheckStatus rc=-3
```
**rc=-3 расшифровывается самим PassSDKDemo как "low voltage"** (низкое напряжение печатающей головки). Батарея при этом 100%/8402mV, MCU power node `/sys/devices/platform/mcu_dev/mcudev_pwren` включён (=1). Вероятно аппаратная особенность конкретного экземпляра (просадка по линии питания головки) или перегрев. **Код печати верен** — последовательность 1-в-1 из PassSDKDemo (`PrintInit → SetGray → SetFont → Str* → Start`).

### ⚠️ SCAN — модуль виден, но libPosApi возвращает rc=-1002
```
ScanOpen rc=-1002
```
Вендорская реализация 1D-сканера в PassSDKDemo идёт **не через libPosApi**, а через broadcast `ACTION_BAR_SCANCFG` + приём `EXTRA_SCAN_DATA` (см. `ScanActivity.java`). Также работает системный binder `scannerservice` (`IScannerService`, libscanner1d_jni.so, Honeywell). Модуль физически присутствует, для использования — через binder API.

### ✅ PCI/crypto — read-only проверки
```
Lib_PciGetRnd  rc=0  rnd=7934F9BEC660A5D0...
Lib_PciReadKcv rc=-3 (слоты пустые — ключи не зашиты, ожидаемо)
Lib_Des        rc=0  DES(00..00, key=00..00) = 8CA64DE9C1B123A7  ✓ эталонный вектор
```
DES-вектор совпал с эталоном → криптодвижок исправен.

### ✅ EMV detect
```
Lib_EntryPoint rc=1  (1=ICC — чип в слоте, верно детектирован)
```

---

## 6. Известные ограничения / заметки

1. **32-bit only**: `dalvikvm32`, не `dalvikvm64`. На 64-битном вызове `UnsatisfiedLinkError: libPosApi.so is 32-bit instead of 64-bit`.
2. **`misc open: No such file or directory`** — безобидный stderr от libPosApi при обращении к LED/принтеру, подавляется фильтром `grep -v "misc open"`.
3. **AppInit rc=случайное большое число** — это указатель на контекст библиотеки, не код ошибки. rc=0 не требуется.
4. **MSR требует физического свайпа** — без оператора проверяется только open/check (модуль живой).
5. **Сканер в libPosApi сломан** (rc=-1002) — использовать binder `scannerservice` или broadcast API.
6. **PSAM отсутствует физически** (rc=-2102), подтверждено аппаратным ресерчем.
7. **LED4 нет** (rc=-1), LED1-3 есть.

---

## 7. Файлы проекта

| Путь | Назначение |
|------|-----------|
| `/c/Users/admin/ZCodeProject/postest/src/` | исходники |
| `/c/Users/admin/ZCodeProject/postest/postest_dex.jar` | собранный dex |
| `/data/local/tmp/postest_dex.jar` (на терминале) | задеплоенный dex |
| `/c/Users/admin/ZCodeProject/passsdk_src/` | декомпилированный PassSDKDemo (референс) |

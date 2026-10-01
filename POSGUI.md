# PosGUI — графический тестер железа aQsi 5-Ф

> Дата: 2026-10-01
> Устройство: aQsi 5-Ф / Ciontek CS10-PCD (MT6737M, Android 7.0)
> Установка: обычный APK, `adb install`

**PosGUI** — GUI-приложение (APK) для ручной проверки всего железа терминала прямо на его экране. Это «наследник» консольного [PosTestSuite](postest/) и по функциям повторяет вендорский PassSDKDemo, но с современным интерфейсом: кнопки сверху, лог выполнения снизу.

![screenshot](posgui/screenshot_v4.png)

---

## 1. Что умеет (кнопки)

| Кнопка | Что делает | JNI/API |
|--------|-----------|---------|
| **SYS info** | версия прошивки, SN, ChipID | `SysGetVersion`, `SysReadSN`, `SysReadChipID` |
| **Beep** | писк | `SysBeep` |
| **LEDs blink 1-4** | мигнуть всеми LED | `SysSetLedMode` |
| **ICC chip card** | чип: check/open/ATR + SELECT 1PAY/2PAY | `IccCheck/Open/Command/Close` |
| **NFC / PICC** | NFC: UID + SELECT PPSE (EMV) | `PiccOpen/Check/Command/Close` |
| **Mifare M1 read block 4** | чтение Mifare Classic | `PiccM1Authority/ReadBlock` |
| **MSR swipe (30s)** | магнитная полоса, ждёт свайп 30с | `McrOpen/Check/Read/Close` |
| **Print sample** | тестовый чек | `PrintInit/SetGray/SetFont/Str/Start/Close` |
| **Scan 1D barcode (10s)** | 1D-сканер, ждёт штрих-код 10с | `Scan.Lib_ScanOpen/Read/Close` |
| **PCI crypto** | rnd + DES-эталон + KCV | `PciGetRnd`, `Des`, `PciReadKcv` |
| **EMV entry point detect** | авто-определение EMV-карты (блокирующий ~30с): 0=MSR / 1=ICC / 2=Paypass / 3=payWave / 8=нет карты. **Важно:** детектирует только платёжные EMV-карты (МИР/UnionPay/Paypass/payWave), не любые NFC. Если карта не EMV — покажет `8`, а ниже диагностика `Card IS present ... but NOT an EMV payment card` | `EntryPoint_Open/Detect/Close` + `PiccCheck` для диагностики |
| **ALL** | все неинтерактивные тесты подряд | — |

Каждый тест пишет результат в лог (rc-коды + данные). Кнопка **Clear log** очищает.

---

## 2. Архитектура

```
posgui/
├── AndroidManifest.xml
├── res/layout/activity_main.xml   # LinearLayout: кнопки + лог + clear
├── src/com/posgui/MainActivity.java  # единственная activity, вся логика
├── smali_all/                      # vpos.apipackage + com/cspos (из PassSDKDemo)
│   ├── vpos/apipackage/*.smali     # JNI-обёртки (Sys/Icc/Mcr/Picc/Print/Scan/Pci/...)
│   └── com/cspos/**/*.smali        # зависимости PosApiHelper
├── build.sh                        # полная сборка APK
└── posgui.apk                      # готовый подписанный APK
```

### Ключевая идея: не переписывать JNI-обёртки

Вместо того чтобы писать свои `vpos.apipackage.*` классы (как в PosTestSuite), PosGUI **переиспользует оригинальные из PassSDKDemo**:
1. `classes.dex` из `passsdkdemo.apk` → `baksmali` → smali-код.
2. Оставляем только `vpos/apipackage/**` и `com/cspos/**` (зависимость `PosApiHelper`).
3. `smali` собирает их в `vpos_classes.dex`.
4. `d8` мержит с dex'ом нашего `MainActivity`.

MainActivity вызывает `PosApiHelper` **через reflection** (`Class.forName("vpos.apipackage.PosApiHelper")`), поэтому не нужен compile-time доступ к этим классам — javac видит только `android.jar`.

### Почему reflection

- `PosApiHelper` в PassSDKDemo использует `android.content.Context` и другие android-зависимости в сигнатурах — напрямую компилировать против него сложно.
- Reflection позволяет вызывать любые методы, не зная их на этапе компиляции, и не тащить в проект полный `android/support`.

### Нативные библиотеки

В APK вкладываются `.so` из PassSDKDemo (`lib/armeabi-v7a/`): `libPosApi.so`, `libPosApi_callback.so`, `libPaypassApi.so`, `libVisaLib.so`. Они загружаются стандартным `System.loadLibrary("PosApi")` из JNI-обёрток.

---

## 3. Сборка (с нуля)

Требуется: JDK 17, Android SDK build-tools 34, `smali.jar`, `baksmali.jar`.

```bash
cd posgui

# 1. Положить рядом passsdkdemo.apk (исходник vpos-классов и .so)
# 2. Извлечь smali (один раз)
unzip -o ../passsdkdemo.apk classes.dex
java -jar ../baksmali.jar disassemble classes.dex -o smali_all
rm -rf smali_all/android smali_all/test smali_all/com/google   # не нужно

# 3. Собрать APK
./build.sh
```

`build.sh` делает 8 шагов:
1. `aapt2 compile --dir res` — ресурсы
2. `aapt2 link --java gen` — APK-база + R.java
3. `javac` — MainActivity + R
4. `d8` — app classes → dex
5. `smali assemble smali_all` — vpos → dex
6. `d8 merge` — финальный classes.dex
7. добавить classes.dex + `lib/*.so` в APK
8. `apksigner sign` — подпись debug-ключом

Результат: `posgui.apk` (~1.5 МБ).

---

## 4. Установка и запуск

```bash
adb install -r posgui.apk
adb shell monkey -p com.posgui -c android.intent.category.LAUNCHER 1
```

Или найти «PosGUI Tester» в лаунчере.

---

## 5. Проверенные результаты (2026-10-01)

Все тесты запущены через UI-тапы на живом терминале (карты в чип-слоте и на NFC):

```
=== SYS ===
GetVersion rc=0 hex=0404080106090200
SN rc=0 [1002568497007021]
ChipID rc=0 B26701220C08F74F00072A7D9E784D31

=== BEEP ===  rc=0
=== LEDs ===  LED1-4 on=0 off=0

=== ICC chip ===
IccCheck rc=0 (card present)
IccOpen rc=0 ATR=0B3B670000868850424F4333   ← "PBOC3"
SELECT 1PAY rc=0 SW=6A82
SELECT 2PAY rc=0 SW=6A82

=== NFC / PICC ===
PiccOpen rc=0
PiccCheck('A') rc=0 SN=D04EE541
SELECT PPSE rc=0 SW=9000
  FCI=...4F07A0000006581010870101           ← AID UnionPay
```

Остальные кнопки (MSR/Print/Scan/PCI/EMV/Mifare/ALL) доступны для ручной проверки — логика идентична консольному PosTestSuite, который эти модули уже проверил (см. [PASSDKCLONE.md](PASSDKCLONE.md)).

---

## 6. Отличия от PosTestSuite

| | PosTestSuite | PosGUI |
|---|---|---|
| Интерфейс | консоль (dalvikvm) | GUI (APK) |
| Установка | не нужна (push jar) | `adb install` |
| JNI-классы | свои (9 файлов) | оригинальные из PassSDKDemo (smali) |
| Вызов API | прямые static-вызовы | reflection через PosApiHelper |
| Интерактив | по аргументам | по кнопкам |
| Для кого | автоматизация, ADB | ручная проверка на экране |

---

## 7. Файлы

| Путь | Назначение |
|------|-----------|
| `posgui/src/com/posgui/MainActivity.java` | вся логика и UI |
| `posgui/smali_all/` | vpos JNI-классы из PassSDKDemo |
| `posgui/build.sh` | сборка APK |
| `posgui/posgui.apk` | готовый APK |
| `posgui/screenshot*.png` | скриншоты с терминала |

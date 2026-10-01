# PosTestSuite — консольный клон PassSDKDemo

Полная консольная замена вендорского PassSDKDemo (`test.apidemo.activity`) для aQsi 5-Ф / Ciontek CS10-PCD. Работает **без установки APK** через `dalvikvm32`.

## Быстрый старт

```bash
# Сборка и пуш на терминал (Git Bash)
./build.sh

# Запуск всех неинтерактивных тестов (на терминале через adb)
MSYS_NO_PATHCONV=1 adb shell \
  "LD_LIBRARY_PATH=/data/app/test.apidemo.activity-1/lib/arm:/system/lib \
   dalvikvm32 -cp /data/local/tmp/postest_dex.jar com.postest.PosTestSuite"

# Только чип + NFC
... PosTestSuite icc picc

# Интерактив (MSR ждёт свайп 60с, сканер ждёт штрих-код 10с)
... PosTestSuite msr scan wait
```

Под Windows CMD — `build.bat`.

## Сьюты

| Аргумент | Что тестирует | Аналог activity |
|----------|---------------|-----------------|
| `sys`   | версия, SN, ChipID, RTC, beep, LED, tamper | SysActivity |
| `icc`   | чип-карта: check/open/ATR/SELECT/PSAM | IccActivity |
| `picc`  | NFC: check/polling/NDEF/Mifare/EMV APDU | PiccActivity |
| `msr`   | магнитная полоса (open/check, со `wait` — свайп) | McrActivity |
| `print` | принтер: init/font/str/start | PrintActivity |
| `scan`  | 1D-сканер (open; см. примечание про binder) | ScanActivity |
| `pci`   | крипто: rnd, KCV, DES-эталон | PciActivity |
| `emv`   | EntryPoint detect (MSR/ICC/NFC) | EmvTestActivity |
| `misc`  | Test_uarts | — |

Без аргументов — все сьюты.

## Документация

Полные результаты прогона, расшифровка кодов, ограничения — в [../PASSDKCLONE.md](../PASSDKCLONE.md).

# Разблокировка терминала aQsi 5-Ф (CS10) в домашнее Android-устройство

Полная инструкция по превращению кассового терминала **aQsi 5-Ф** (модель CS10, MediaTek MT6737M, Android 7.0) в обычное Android-устройство для домашнего использования: снятие киоск-лаунчера, установка свободного лаунчера KISS, магазина F-Droid и приложений.

> ⚠️ **Важно**: выполняйте только на своём устройстве. Все действия обратимы (бэкапы создаются на каждом этапе). Системные службы принтера, EMV и железа **не затрагиваются** — отключается только кассовый лаунчер.

## Содержание

1. [Требования](#требования)
2. [Шаг 1. Диагностика и бэкап](#шаг-1-диагностика-и-бэкап)
3. [Шаг 2. Снятие блокировки установки APK (whitelist)](#шаг-2-снятие-блокировки-установки-apk-whitelist)
4. [Шаг 3. Установка чистого лаунчера (KISS)](#шаг-3-установка-чистого-лаунчера-kiss)
5. [Шаг 4. Отключение кассового киоска](#шаг-4-отключение-кассового-киоска)
6. [Шаг 5. Снятие системных ограничений](#шаг-5-снятие-системных-ограничений)
7. [Шаг 6. Установка F-Droid и приложений](#шаг-6-установка-f-droid-и-приложений)
8. [Проблемы и решения (FAQ)](#проблемы-и-решения-faq)
9. [Откат изменений](#откат-изменений)

---

## Требования

- ПК с Windows (инструкция для Git Bash / PowerShell; на Linux/macOS команды `adb` идентичны).
- [Android SDK Platform-Tools](https://developer.android.com/tools/releases/platform-tools) (`adb` в PATH).
- USB-кабель, терминал aQsi 5-Ф с включённой отладкой по USB.
- Интернет на ПК (для скачивания APK) и на терминале (для F-Droid).

## Шаг 1. Диагностика и бэкап

```bash
# Проверить подключение
adb devices -l
# Ожидаем: 0123456789ABCDEF  device product:CS10 model:CS10 device:a26_6737m

# Версия Android (у нас 7.0, API 24)
adb shell getprop ro.build.version.release

# Полный бэкап списка пакетов — обязательно!
adb shell pm list packages -f > installed_packages_backup.txt

# Узнать текущий лаунчер (HOME)
adb shell cmd package resolve-activity --brief \
  -a android.intent.action.MAIN -c android.intent.category.HOME
# Ожидаем: ru.aqsi.launcher/.LauncherActivity
```

Пакеты aQsi на устройстве (не трогаем ничего, кроме лаунчера):

```
ru.aqsi.launcher          ← кассовый киоск-лаунчер (ОТКЛЮЧАЕМ только его)
ru.aqsi.cashierworkplace  ← рабочее место кассира
ru.aqsi.market, ru.aqsi.support, ru.aqsi.updater, ru.aqsi.pushservice,
ru.aqsi.cryptoservice, ru.aqsi.welcome, ru.aqsi.devmode, ru.aqsi.otk, ru.aqsi.rr
ru.sberbank.*             ← платёжные сервисы Сбера
```

## Шаг 2. Снятие блокировки установки APK (whitelist)

**Это ключевой и неочевидный шаг.** Прошивка aQsi содержит пропатченный `PackageManagerService`: при установке любого APK вызывается кастомный класс `com.android.server.WhiteList`, который читает файл `/data/apkins/package_ins_cfg` — белый список разрешённых к установке пакетов. Если пакета нет в списке — установка молча падает с `INSTALL_FAILED_INVALID_APK` (даже для валидных и системных APK).

Диагностика проблемы:

```bash
adb push some_app.apk /data/local/tmp/app.apk
adb shell pm install -r /data/local/tmp/app.apk
# Failure [INSTALL_FAILED_INVALID_APK]  ← признак блокировки whitelist

# В logcat видно причину:
adb logcat -d | grep -i whitelist
# com.android.server.WhiteList.readFile(WhiteList.java:122)
# check whitelist permission : mCodeTag = true, pkgName = ...
```

Смотрим текущий белый список и делаем бэкап:

```bash
adb shell cat /data/apkins/package_ins_cfg
# там список пакетов aQsi/Сбера: ru.aqsi.launcher, ru.aqsi.market, ...

# Бэкап оригинала (на устройство и на ПК)
adb shell cp /data/apkins/package_ins_cfg /data/local/tmp/package_ins_cfg.orig
adb pull /data/local/tmp/package_ins_cfg.orig package_ins_cfg.orig.txt
```

Разрешаем установку любых APK. Логика класса `WhiteList`: если файл содержит **единственную строку `*`**, разрешена установка всего (`you can install all apk`). Если строк несколько — работает проверка по префиксам имён пакетов, и `*` среди них не сработает.

```bash
adb shell "printf '*\n' > /data/apkins/package_ins_cfg"
adb shell cat /data/apkins/package_ins_cfg   # должно вывести: *
```

> Права на файл `-rwxrw-rw- system:system` — запись через adb shell доступна без root.

## Шаг 3. Установка чистого лаунчера (KISS)

Для слабого железа (MT6737M, Android Go-класс) подходит лёгкий открытый лаунчер **KISS**.

> ⚠️ **Подводный камень**: на GitHub в релизе `v3.18.0` нет прикреплённого APK — `https://github.com/Neamar/KISS/releases/download/v3.18.0/kiss-3.18.0.apk` отдаёт 404. Последний APK на GitHub — `v3.17.0/app-release.apk`. Актуальные версии публикуются в **F-Droid**. Берём последнюю версию оттуда:

```bash
# Скачать KISS (актуальная версия с F-Droid, на момент написания — 3.26.0)
curl -L -o kiss_launcher.apk "https://f-droid.org/repo/fr.neamar.kiss_224.apk"

# Проверить целостность
unzip -t kiss_launcher.apk | tail -2

# Установить (на Android 7 надёжнее через push + pm install, а не adb install)
adb push kiss_launcher.apk /data/local/tmp/kiss.apk
adb shell pm install -r /data/local/tmp/kiss.apk
# Success

# Проверить
adb shell pm list packages | grep kiss
# package:fr.neamar.kiss
```

## Шаг 4. Отключение кассового киоска

```bash
# Отключаем ТОЛЬКО лаунчер (сервисы принтера/EMV/железа не трогаем!)
adb shell pm disable-user --user 0 ru.aqsi.launcher
# Package ru.aqsi.launcher new state: disabled-user

# Нажимаем Home
adb shell input keyevent 3

# Проверяем, что HOME теперь ведёт в KISS
adb shell cmd package resolve-activity --brief \
  -a android.intent.action.MAIN -c android.intent.category.HOME
# fr.neamar.kiss/.MainActivity
```

При первом запуске KISS может запросить доступ к контактам (для быстрого поиска) — разрешите или отклоните на экране.

## Шаг 5. Снятие системных ограничений

```bash
# Установка из внешних источников
adb shell settings put secure install_non_market_apps 1

# Настройки разработчика и ADB остаются активными
adb shell settings put global development_settings_enabled 1
adb shell settings put global adb_enabled 1

# Отключить подтверждение установки через ADB (MTK) и верификатор пакетов
adb shell settings put secure adb_install_need_confirm 0
adb shell settings put global package_verifier_enable 0

# Проверить, что системные настройки открываются
adb shell am start -a android.settings.SETTINGS
```

## Шаг 6. Установка F-Droid и приложений

F-Droid — магазин свободных приложений, откуда дальше можно ставить всё необходимое без ПК.

```bash
# F-Droid
curl -L -o fdroid.apk "https://f-droid.org/F-Droid.apk"
adb push fdroid.apk /data/local/tmp/fdroid.apk
adb shell pm install -r /data/local/tmp/fdroid.apk

# Сканер QR/штрих/2D-кодов — Binary Eye (открытый, поддерживает
# QR, Data Matrix, Aztec, PDF417, EAN, UPC, Code 39/93/128 и др.)
# Проверено: версия 1.75.4 (_179.apk)
curl -L -o binaryeye.apk "https://f-droid.org/repo/de.markusfisch.android.binaryeye_179.apk"
adb push binaryeye.apk /data/local/tmp/binaryeye.apk
adb shell pm install -r /data/local/tmp/binaryeye.apk
```

> Номер версии в имени файла (`_179.apk`) со временем меняется — актуальную ссылку смотрите на странице пакета: https://f-droid.org/packages/de.markusfisch.android.binaryeye/

> После первого запуска Binary Eye запросит выбор режима («Простой» / «Расширенный») и доступ к камере — разрешите на экране. Для проверки установленного: `adb shell pm list packages | grep -E "fdroid|binaryeye|kiss"`

Проверка:

```bash
adb shell pm list packages | grep -E "fdroid|binaryeye|kiss"
# package:de.markusfisch.android.binaryeye
# package:org.fdroid.fdroid
# package:fr.neamar.kiss
```

Проверенные на устройстве версии:

| Пакет | Версия |
|---|---|
| fr.neamar.kiss (KISS Launcher) | 3.26.0 |
| org.fdroid.fdroid (F-Droid) | 1.23.2 |
| de.markusfisch.android.binaryeye (Binary Eye) | 1.75.4 |

## Проблемы и решения (FAQ)

### `INSTALL_FAILED_INVALID_APK` на любой APK
Это whitelist прошивки — см. [Шаг 2](#шаг-2-снятие-блокировки-установки-apk-whitelist). Диагностика: `adb logcat -d | grep -i whitelist` покажет `com.android.server.WhiteList`.

### `adb install` зависает / падает, а `pm install` работает
На Android 7.0 streamed install через `adb install` нестабилен. Используйте `adb push` в `/data/local/tmp/` + `adb shell pm install -r`.

### Git Bash ломает пути (`C:/Program Files/Git/data/...`)
MSYS конвертирует unix-пути в Windows-пути. Лечения три варианта:
- префикс команды: `MSYS_NO_PATHCONV=1 adb shell ...`
- двойной слэш: `adb push app.apk //data/local/tmp/app.apk`
- целиком в кавычках: `adb shell "pm install -r /data/local/tmp/app.apk"`

### `findstr`/`grep` по пакетам выдаёт кракозябры
Кодировка консоли Windows. Используйте `grep` из Git Bash вместо `findstr`, либо `chcp 65001`.

### KISS не появляется после disable лаунчера
```bash
adb shell input keyevent 3   # Home
# Если предложит выбор лаунчера — выберите KISS и "Всегда"
```

### После перезагрузки всё вернулось
`pm disable-user` персистентен. Если киоск вернулся — вероятно, его восстановил `ru.aqsi.updater`. Отключите и его: `adb shell pm disable-user --user 0 ru.aqsi.updater` (предварительно убедитесь, что вам не нужны обновления aQsi).

## Откат изменений

```bash
# Вернуть кассовый лаунчер
adb shell pm enable ru.aqsi.launcher

# Вернуть whitelist прошивки
adb push package_ins_cfg.orig.txt /data/local/tmp/package_ins_cfg.orig
adb shell "cat /data/local/tmp/package_ins_cfg.orig > /data/apkins/package_ins_cfg"

# Удалить установленные приложения
adb shell pm uninstall fr.neamar.kiss
adb shell pm uninstall org.fdroid.fdroid
adb shell pm uninstall de.markusfisch.android.binaryeye
```

---

*Инструкция проверена на реальном терминале aQsi 5-Ф (CS10, Android 7.0, security patch 2017-07-05).*

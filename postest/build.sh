#!/bin/bash
# Build PosTestSuite: javac -> d8 -> adb push
set -e
cd "$(dirname "$0")"
D8=/c/Users/admin/scoop/persist/android-clt/build-tools/34.0.0/d8.bat

rm -rf out && mkdir -p out
javac -encoding UTF-8 -d out src/vpos/apipackage/*.java src/com/postest/PosTestSuite.java
"$D8" --output=postest_dex.jar out/com/postest/*.class out/vpos/apipackage/*.class
MSYS_NO_PATHCONV=1 adb push postest_dex.jar //data/local/tmp/postest_dex.jar
echo "OK: pushed to /data/local/tmp/postest_dex.jar"

@echo off
REM Build PosTestSuite on Windows: javac -> d8 -> adb push
cd /d %~dp0
set D8=C:\Users\admin\scoop\persist\android-clt\build-tools\34.0.0\d8.bat

if exist out rmdir /s /q out
mkdir out
javac -encoding UTF-8 -d out src\vpos\apipackage\*.java src\com\postest\PosTestSuite.java
%D8% --output=postest_dex.jar out\com\postest\*.class out\vpos\apipackage\*.class
adb push postest_dex.jar /data/local/tmp/postest_dex.jar
echo OK: pushed to /data/local/tmp/postest_dex.jar

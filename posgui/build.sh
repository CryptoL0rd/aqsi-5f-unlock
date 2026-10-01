#!/bin/bash
# Build PosGUI APK: aapt2(R) -> javac -> d8 -> smali(vpos) -> aapt2(link) -> add dex/libs -> sign
set -e
cd "$(dirname "$0")"

BT=/c/Users/admin/scoop/persist/android-clt/build-tools/34.0.0
AJAR=/c/Users/admin/scoop/persist/android-clt/platforms/android-34/android.jar
SMALI_JAR=/tmp/smali.jar
KS=posgui.keystore
ALIAS=posgui

echo "[1/8] aapt2 compile resources"
rm -rf res_compiled gen && mkdir -p res_compiled gen
"$BT/aapt2.exe" compile --dir res -o res_compiled/res.zip

echo "[2/8] aapt2 link (generates R.java in gen/)"
"$BT/aapt2.exe" link -o posgui_base.apk \
  -I "$AJAR" \
  --manifest AndroidManifest.xml \
  --java gen \
  res_compiled/res.zip

echo "[3/8] javac (app + generated R)"
rm -rf out && mkdir -p out
find gen -name "*.java" > gen_sources.txt
javac -encoding UTF-8 -source 8 -target 8 \
  -classpath "$AJAR" \
  -d out src/com/posgui/MainActivity.java @gen_sources.txt

echo "[4/8] d8 (app classes)"
"$BT/d8.bat" --output=out_dex.jar out/com/posgui/*.class

echo "[5/8] smali (vpos.apipackage from PassSDKDemo)"
java -jar "$SMALI_JAR" assemble smali_all -o vpos_classes.dex

echo "[6/8] merge dexes"
"$BT/d8.bat" --output=final_dex.jar out_dex.jar vpos_classes.dex

echo "[7/8] add classes.dex + native libs"
unzip -o -q final_dex.jar classes.dex -d .
jar uf posgui_base.apk classes.dex
unzip -o -q ../passsdkdemo.apk "lib/armeabi-v7a/*.so" -d native
( cd native && jar uf ../posgui_base.apk lib )

echo "[8/8] sign"
if [ ! -f "$KS" ]; then
  keytool -genkeypair -v -keystore "$KS" -alias "$ALIAS" \
    -keyalg RSA -keysize 2048 -validity 10000 \
    -storepass posgui123 -keypass posgui123 \
    -dname "CN=PosGUI, OU=Test, O=Test, L=Test, S=Test, C=RU" 2>/dev/null
fi
"$BT/apksigner.bat" sign --ks "$KS" --ks-pass pass:posgui123 \
  --key-pass pass:posgui123 --out posgui.apk posgui_base.apk

echo "OK: posgui.apk"
ls -la posgui.apk

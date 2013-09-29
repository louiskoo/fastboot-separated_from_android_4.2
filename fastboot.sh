#!/bin/sh

while [ 1 ]
do
	adb wait-for-device
	#检测到设备插入
	#清除屏幕
	#开始准备工作...
	./sclient "--clean"
	./sclient "--start"
	./sclient "--desc 开始准备工作"
	adb shell mkdir -p /cache/recovery
	adb push extendedcommand /cache/recovery/extendedcommand
	adb shell "echo 4ec143fbf9be2f2440a73d374b3839a3 > /cache/recovery/.salted_hash"
	adb shell rm /cache/recovery/command
	adb shell mkdir -p /sdcard/clockworkmod
	adb shell "echo 1 > /sdcard/clockworkmod/.recoverycheckpoint"
	#进入刷机模式...
	./sclient "--desc 进入刷机模式"
	adb reboot bootloader
	fastboot flash unlocktoken Unlock_code.bin
	fastboot boot recovery-clockwork-5.0.2.0-saga.img
	#恭喜你，手机已进入自动刷机模式，可以拔出USB线接下一台手机了
	./sclient "--desc 恭喜你，手机已进入自动刷机模式，可以拔出USB线接下一台手机了"
	./sclient "--desc 等待下一台手机"
	#等待下一台手机
done	

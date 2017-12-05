# About

Tired apps with good graphics and sound? Expirence nostalgie about good old days with pixelated games and 8-bit sound? Just tired good life and wanna try something new?

# Screenshots

You can do it with almost any app:

![a](1.png)
![a](2.png)
![a](3.png)

# Prerequrements

Assumed what you do it on linux machine and you advanced linux user.

You will need in your system:

* `keytool` - for generating new key
* `jarsigner` - for signing APK
* `zip`, `unzip` and `zipinfo` - for unpacking/repacking APK
* `zipalign` - optional, get it from Android SDK
* `ffmpeg` - for repacking sound (must be compiled with MP3 support)
* `convert` - tool from package ImageMagick
* `optipng` - convert and optimize PNG images

All this tools was in my system, so I used them. You can freely modify script to use other tools.

# How to...

## Step 1: Getting APK

Download APK via any service like apk-dl, evozi downloader or use apps like Raccoon.

You can also extract APK from your device:

        # adb shell pm list packages | grep someapp
        package:com.somecompany.someapp
        # adb shell pm path com.somecompany.someapp
        package:/data/app/com.somecompany.someapp-1.apk
        # adb pull /data/app/com.somecompany.someapp-1.apk
        3806 KB/s (5538818 bytes in 1.421s)

## Step 2: repacking

Save shit.sh to EMPTY directory and then just type:

`bash shit.sh your_apk_file.apk`

Thats all!

WARNING: don't use it inside directory with other files!

## Step 3: Backup your data

If in your APP have some sensive data (opened levels and top scores), you will lost all data during uninstall. So, PLEASE DO BACKUP now.

## Step 4: Uninstall original app

        # adb com.somecompany.someapp
        Success

## Step 5: Install repacked version

Result will be saved in shit_oldfague.apk, so install it

        # adb install shit_oldfague.apk
        4073 KB/s (5457196 bytes in 1.308s)
                pkg: /data/local/tmp/shit_oldfague.apk
        Success

And now enjoy new game!

# Legal

Don't redistribute pached apps. This code provided only in educational purpose. And other bla-bla-bla goes here.


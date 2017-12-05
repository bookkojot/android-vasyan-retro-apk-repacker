#!/bin/bash

# Remove files what can interfere with script and unpack APK (it's just zip archive)
# Don't launch me in directory with other files!!!

rm shit.bmp shit.png tmp.jar shit_oldfague.apk files-to-compress
rm -r shit
unzip -d shit "$1"
zipinfo -1 "$1" | grep -v ^META-INF/ > files-to-compress

# do some uglify with images

find shit -iname "*.jpg" -o -iname "*.jpeg" | while read aa; do convert "$aa" shit.bmp; convert shit.bmp -quality 10 "$aa";rm shit.bmp;done
find shit -iname "*.png" | while read aa; do rm shit.bmp
echo "Processing $aa"
convert "$aa" -ordered-dither o8x8 shit.bmp
optipng -O2 shit.bmp
mv shit.png "$aa"
done

# multiple volume in sounds by 100 times!

find shit -iname "*.ogg" | while read aa; do rm
ffmpeg -nostdin -i "$aa" -af volume=100 -y shit.ogg
echo "Processing $aa"
mv shit.ogg "$aa"
done

find shit -iname "*.mp3" | while read aa; do rm
ffmpeg -nostdin -i "$aa" -af volume=100 -y shit.mp3
echo "Processing $aa"
mv shit.mp3 "$aa"
done

# repack it back!
# do it without any aapt or other shit

cd shit
cat ../files-to-compress | grep ^assets/ | zip -0 -D -X ../tmp.jar -@
cat ../files-to-compress | grep -v ^assets/ | zip -9 -D -X ../tmp.jar -@
cd ..

# Generate new key, if here none

[ ! -e "shit.key" ] && keytool -genkey -keyalg rsa -keystore shit.key -storepass shit123 -keypass shit123 -alias shit -keysize 1024 -dname "CN=1, OU=2, O=shit" -validity 10000

# Signing apk with our key

jarsigner -verbose -keypass shit123 -storepass shit123 -keystore shit.key tmp.jar shit

# Align. Well, not very need, but can improve perfomance.

zipalign 4 tmp.jar shit_oldfague.apk

# Remove temporary files

rm tmp.jar files-to-compress

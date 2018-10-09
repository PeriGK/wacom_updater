 sudo apt-get install linux-headers-$(uname -r) build-essential
 sudo apt-get install autoconf
 if test -x ./autogen.sh; then ./autogen.sh; else ./configure; fi && make && sudo make install || echo "Build Failed"
 
 echo '********************'
 grep "" /sys/module/wacom*/version
 modinfo wacom | grep version
 echo '********************'
 # sudo apt-get update && sudo apt-get install xserver-xorg-input-wacom
 sudo apt-get install autoconf pkg-config make xutils-dev libtool xserver-xorg-dev libx11-dev libxi-dev libxrandr-dev libxinerama-dev libudev-dev
 sudo make clean
 set -- --prefix="/usr" --libdir="$(readlink -e $(ls -d /usr/lib*/xorg/modules/input/../../../ | head -n1))"
 if test -x ./autogen.sh; then ./autogen.sh "$@"; else ./configure "$@"; fi && make && sudo make install || echo "Build Failed"

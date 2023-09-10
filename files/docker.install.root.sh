#!/usr/bin/env bash
set -x

export CMD_PATH=$(cd `dirname $0`; pwd)
export PROJECT_NAME="${CMD_PATH##*/}"
export TERM=xterm-256color
echo $PROJECT_NAME
cd $CMD_PATH
env

zypper lr -d
zypper mr -da

zypper ar -fcg https://mirrors.ustc.edu.cn/opensuse/tumbleweed/repo/oss USTC:OSS
zypper ar -fcg https://mirrors.ustc.edu.cn/opensuse/tumbleweed/repo/non-oss USTC:NON-OSS
zypper ar -fcg https://mirrors.ustc.edu.cn/opensuse/update/tumbleweed/ USTC:UPDATE

zypper ref

ln -sf "/usr/share/zoneinfo/Asia/Shanghai" "/etc/localtime"

zypper install -y which
zypper install -y python311-xmltodict 
zypper install -y python3-kiwi
zypper install -y dracut
zypper install -y qemu
zypper install -y checkmedia
zypper install -y qemu-img
zypper install -y dosfstools
zypper install -y git
zypper install -y sudo
zypper install -y tar
which qemu-img
which rpmdb



export HOME=/root
export USER=root

# 2 Add builder User
cat /etc/passwd
cd /root/
mkdir versions

cd versions

zypper patches > zypper.patches.txt 
zypper packages > zypper.packages.txt 
zypper patterns > zypper.patterns.txt 
zypper products > zypper.products.txt 
zypper search --installed-only > zypper.installed.txt 


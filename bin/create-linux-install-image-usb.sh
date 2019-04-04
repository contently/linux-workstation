#!/usr/bin/env bash

# Note: these only work from Debian currently. Will update to make more independent later.

echo ""
echo "# Verify USB device target given"
echo ""

usb_dev=$1

if [ $usb_dev ]; then
    echo $usb_dev
else
    echo "  ! No USB device target given"
    exit 1
fi

# install necessary libs
echo ""
echo "# Install 'gpg'"
echo ""

if [ `which gpg | wc -l` -ne 0 ]; then
     echo "  > 'gpg' already installed"
else
     sudo apt-get install gnupg -y
fi

# download debian keyring
# https://keyring.debian.org/
# TODO add a conditional checking if this succeeds
echo ""
echo "# Install Debian keyring"
echo ""

gpg --keyserver keyring.debian.org --recv-keys 0x673A03E4C1DB921F

# download linux image
echo ""
echo "# Download Debian image"
echo ""

if [ -f 'tmp/debian-9.8.0-amd64-DVD-1.iso' ]; then
    echo "  > debian-9.8.0-amd64-DVD-1.iso file already exists"
else
    wget -P tmp/ https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/debian-9.8.0-amd64-DVD-1.iso
fi

# verify downloaded linux image
echo ""
echo "# Download SHA512SUMS"
echo ""

if [ -f 'tmp/SHA512SUMS' ]; then
    echo "  > SHA512SUMS file already exists"
else
    wget -P tmp/ https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/SHA512SUMS
fi

echo ""
echo "# Download SHA512SUMS.sign"
echo ""

if [ -f 'tmp/SHA512SUMS.sign' ]; then
    echo "  > SHA512SUMS.sign file already exists"
else
    wget -P tmp/ https://cdimage.debian.org/debian-cd/current/amd64/iso-dvd/SHA512SUMS.sign
fi

echo ""
echo "# Verify integrity of downloaded Debian image file"
echo ""

cd tmp
if [ `sha512sum -c SHA512SUMS 2> /dev/null | grep debian-9.8.0-amd64-DVD-1.iso | wc -l` -ne 0 ]; then
     echo "  > File verified"
else
     echo "  ! File was unable to be verified"
     exit 1
fi
cd ..

# TODO validate the integrity of SHA512SUMS.sign

# copy linux image over and sync
echo ""
echo "# Copy and sync installation image to USB"
echo "# This can take a while, to monitor progress run this cmd in a different terminal:"
echo "# '$ watch grep -e Dirty: -e Writeback: /proc/meminfo' and wait for 'Dirty' to get to 0"
echo ""

sudo cp tmp/debian-9.8.0-amd64-DVD-1.iso $usb_dev
sync

echo ""
echo "#############################################"
echo "Linux installation image successfully created"
echo "You are free to unplug and use your USB stick"
echo "#############################################"
echo ""
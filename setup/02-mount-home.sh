#!/usr/bin/env
HOMEDRIVE=`sudo fdisk -l | grep WD10EZEX -B1 | cut -d' ' -f2 | head -n -1 | sed 's/:$/1/'`
HOMEDRIVE_UUID=`sudo blkid $HOMEDRIVE | cut -d' ' -f 2 | cut -d'=' -f 2 | sed 's/"//g'`
echo "UUID=$HOMEDRIVE_UUID /mnt/dearly-lts ext4 noatime,errors=remount-ro 0 1" | sudo tee -a /etc/fstab
sudo mkdir /mnt/dearly-lts
systemctl daemon-reload
sudo mount -a

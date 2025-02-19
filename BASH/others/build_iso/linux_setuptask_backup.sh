#!/usr/bin/env bash
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: TASK - Linux setup/backup ISO
# Date: Feb/2025
# Version: 0.1.0
################################################

set -o errexit
set -o pipefail

################################################


### 
### Refer to https://dev.to/vaiolabs_io/how-to-create-custom-debian-based-iso-4g37
### 

# Build one file 
sudo mksquashfs  / filesystem.squashfs -comp xz -b 1M -noappend -e /tmp -e /var -e /mnt

#
xorriso -as mkisofs -r -V 'LMDE-6.custom ISO' -o 'LMDE-6.custom.iso' -J -l \
	-b isolinux/isolinux.bin \
	-c isolinux/boot.cat \
	-no-emul-boot \
	-boot-load-size 4 \
	-boot-info-table \
	-eltorito-alt-boot \
	-e boot/grub/efi.img \
	-no-emul-boot \
	-isohybrid-gpt-basdat \
	-isohybrid-apm-hfsplus \
	-isohybrid-mbr \
			filesystem.squashfs




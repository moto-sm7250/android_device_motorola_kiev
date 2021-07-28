#!/system/bin/sh

fstab_fixup()
{
	sed -i "s|fsync_mode=nobarrier,inlinecrypt|fsync_mode=nobarrier" /system/etc/recovery.fstab
	sed -i "s|fileencryption=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized,keydirectory=/metadata/vold/metadata_encryption,quota,reservedsize=512M|quota,reservedsize=128M|" /system/etc/recovery.fstab

}

fstab_fixup

exit 0

#!/system/bin/sh

fstab_fixup()
{
	sed -i "s|keydirectory=/metadata/vold/metadata_encryption,quota,reservedsize=512M|quota,reservedsize=128M|" /system/etc/recovery.fstab
}

fstab_fixup

exit 0

#!/system/bin/sh

fstab_fixup()
{
	sed -i "s|fileencryption=aes-256-xts:aes-256-cts:v2+inlinecrypt_optimized,keydirectory=/metadata/vold/metadata_encryption,quota,reservedsize=512M,sysfs_path=/sys/devices/platform/soc/1d84000.ufshc,checkpoint=fs|fileencryption=ice,quota,reservedsize=128M,checkpoint=fs|" /system/etc/recovery.fstab
	sed -i "/by-name\/metadata/d" /system/etc/recovery.fstab
}

avb_version()
{
	avb_version=""
	avb_version=$(getprop ro.boot.vbmeta.avb_version)
	    echo "avb version is: [$avb_version]"
	    case $avb_version in
	        1.0)
		        echo "Android 11 Stock Rom Detected"
			    fstab_fixup
			    setprop fbe.metadata.wrappedkey ""
			    setprop ro.product.first_api_level ""
	            ;;
	        *)
	            echo "Android 11+ ROM Detected"
		        setprop fbe.metadata.wrappedkey "true"
		        setprop ro.product.first_api_level "30"
	            ;;
	        esac
}

avb_version

exit 0

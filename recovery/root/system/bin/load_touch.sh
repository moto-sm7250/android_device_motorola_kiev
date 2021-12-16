#!/system/bin/sh

firmware_path=/vendor/firmware
touch_class_path=/sys/class/touchscreen
touch_path=
firmware_file=

load_touch()
{
	touch_product_string=$(ls $touch_class_path)
	panel_supplier=""
	panel_supplier=$(cat /sys/class/touchscreen/*/panel_supplier)
	    echo "panel supplier vendor is: [$panel_supplier]"
	    cd $firmware_path
	    case $panel_supplier in
	        csot)
			    firmware_file="focaltech-csot-ft8756-05-0000-kiev.bin"
	            ;;
	        tm)
			    firmware_file="focaltech-tm-ft8756-07-0000-kiev.bin"
	            ;;
	    esac
	echo "Firmware file for upgrade $firmware_file"
	touch_path=/sys$(cat $touch_class_path/$touch_product_string/path | awk '{print $1}')
	echo "forcing firmware upgrade"
	echo 1 > $touch_path/forcereflash
	echo "sending reflash command"
	echo $firmware_file > $touch_path/doreflash
	sleep 1.5
	setprop touch.fw.loaded 1
}

load_touch

exit 0

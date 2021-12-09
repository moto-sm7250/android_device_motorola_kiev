#!/system/bin/sh

module_path=/vendor/lib/modules
firmware_path=/vendor/firmware
touch_class_path=/sys/class/touchscreen
touch_path=
firmware_file=

wait_for_poweron()
{
	local wait_nomore
	local readiness
	local count
	echo "wait until driver reports <ready to flash>..."
	wait_nomore=60
	count=0
	while true; do
		readiness=$(cat $touch_path/poweron)
		if [ "$readiness" == "1" ]; then
			echo "ready to flash!!!"
			break;
		fi
		count=$((count+1))
		[ $count -eq $wait_nomore ] && break
		sleep 1
		echo "not ready; keep waiting..."
	done
	if [ $count -eq $wait_nomore ]; then
		return 1
	fi
	return 0
}

load_modules()
{
	insmod $module_path/utags.ko
	insmod $module_path/mmi_annotate.ko
	insmod $module_path/mmi_info.ko
	insmod $module_path/tzlog_dump.ko
	insmod $module_path/mmi_sys_temp.ko
	insmod $module_path/qpnp-power-on-mmi.ko
	insmod $module_path/wl2864c.ko
	insmod $module_path/qpnp-smbcharger-mmi.ko
	insmod $module_path/mcDrvModule.ko
	insmod $module_path/exfat.ko
	insmod $module_path/aw8624.ko
	insmod $module_path/sensors_class.ko
	insmod $module_path/mmi_relay.ko
	insmod $module_path/sx933x_sar.ko
	insmod $module_path/touchscreen_mmi.ko
	insmod $module_path/focaltech_0flash_mmi.ko
	insmod $module_path/mmi_sigprint.ko
}

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
	wait_for_poweron
	wait
	echo "forcing firmware upgrade"
	echo 1 > $touch_path/forcereflash
	wait
	echo "sending reflash command"
	echo $firmware_file > $touch_path/doreflash
	wait
	echo "Resetting Touch"
	echo 1 > $touch_path/reset
}

load_modules
wait
load_touch
wait

exit 0

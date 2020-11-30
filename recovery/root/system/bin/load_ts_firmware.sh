#!/sbin/sh

module_path=/sbin/modules

touch_class_path=/sys/class/touchscreen
touch_path=
firmware_path=/vendor/firmware
firmware_file=

# Load all needed modules
insmod $module_path/sensors_class.ko
insmod $module_path/touchscreen_mmi.ko
insmod $module_path/aw8695.ko
insmod $module_path/slg5bm43670.ko
insmod $module_path/utags.ko
insmod $module_path/exfat.ko
insmod $module_path/mmi_annotate.ko
insmod $module_path/mmi_info.ko
insmod $module_path/mmi_sys_temp.ko
insmod $module_path/moto_f_usbnet.ko
insmod $module_path/lcd.ko
insmod $module_path/qpnp-power-on-mmi.ko
insmod $module_path/qpnp-smbcharger-mmi.ko
insmod $module_path/sec_mmi.ko
insmod $module_path/synaptics_i2c.ko
insmod $module_path/synaptics_core_module.ko
insmod $module_path/synaptics_device.ko
insmod $module_path/synaptics_diagnostics.ko
insmod $module_path/synaptics_recovery.ko
insmod $module_path/synaptics_reflash.ko
insmod $module_path/synaptics_testing.ko

return 0


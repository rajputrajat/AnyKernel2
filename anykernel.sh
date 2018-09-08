# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() {
kernel.string=Moxie-Kernel kernel by Ajai Vasudeve
do.devicecheck=1
do.modules=1
do.cleanup=1
do.cleanuponabort=0
device.name1=z2_plus
device.name2=Z2131
device.name3=Z2
device.name4=z2
device.name5=Z2132
} # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=0;
ramdisk_compression=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. /tmp/anykernel/tools/ak2-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
chmod -R 750 $ramdisk/*;
chown -R root:root $ramdisk/*;

## AnyKernel install
dump_boot;

# begin ramdisk changes
insert_line init.rc "init.moxie.rc" after "import /init.qcom.usb.rc" "import /init.moxie.rc";
insert_line init.rc "init.spectrum.rc" after "import /init.moxie.rc" "import /init.spectrum.rc";
# end ramdisk changes

write_boot;

## end install
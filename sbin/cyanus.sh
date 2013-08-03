#!/sbin/sh

# MrViet
# Cyanus kernel

# mount
	/sbin/busybox mount -o remount,rw / /;
	/sbin/busybox mount -o remount,rw /dev/block/stl9 /system;
# modules

/sbin/insmod /system/lib/modules/bcm_headsetsw.ko
/sbin/insmod /system/lib/modules/brcm_headsetsw.ko
/sbin/insmod /system/lib/modules/memalloc.ko
/sbin/insmod /system/lib/modules/hx170dec.ko
/sbin/insmod /system/lib/modules/h6270enc.ko
/sbin/insmod /system/lib/modules/gememalloc.ko    
/sbin/insmod /system/lib/modules/ge_drv.ko   
/sbin/insmod /system/lib/modules/brcm_switch.ko
/sbin/insmod /system/lib/modules/bcm_switch.ko

# Swap
if /sbin/busybox [ ! -f /system/.cyanus/swapoff ]; then

    if [ "$(cat /proc/partitions | grep mmcblk0p3)" != "" ]; then
	    swapon /dev/block/mmcblk0p3
    fi
    
fi;
# Cpu Governor
    /sbin/busybox mkdir /system/.cyanus
    /sbin/busybox mv -f /res/CyanusGuide.txt /system/.cyanus

    if /sbin/busybox [ -f /system/.cyanus/brazillianwax ]; then
	/sbin/busybox echo "brazillianwax" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/interactive ]; then
	/sbin/busybox echo "interactive" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/scary ]; then
	/sbin/busybox echo "Scary" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/userspace ]; then
	/sbin/busybox echo "userspace" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/lazy ]; then
	/sbin/busybox echo "lazy" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/smoothass ]; then
	/sbin/busybox echo "smoothass" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/savagedzen ]; then
	/sbin/busybox echo "SavagedZen" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/interactivex ]; then
	/sbin/busybox echo "interactiveX" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/lagfree ]; then
	/sbin/busybox echo "lagfree" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/minmax ]; then
	/sbin/busybox echo "minmax" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/smartassv2 ]; then
	/sbin/busybox echo "smartassV2" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/conservative ]; then
	/sbin/busybox echo "conservative" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/powersave ]; then
	/sbin/busybox echo "powersave" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/lionheart ]; then
	/sbin/busybox echo "Lionheart" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/ondemand ]; then
	/sbin/busybox echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

    if /sbin/busybox [ -f /system/.cyanus/performance ]; then
	/sbin/busybox echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    fi;

# i/o sched
    if /sbin/busybox [ -f /system/.cyanus/sio ]; then
	/sbin/busybox echo "sio" > /sys/block/mmcblk0/queue/scheduler
    fi;

    if /sbin/busybox [ -f /system/.cyanus/cfq ]; then
	/sbin/busybox echo "cfq" > /sys/block/mmcblk0/queue/scheduler
    fi;

    if /sbin/busybox [ -f /system/.cyanus/deadline ]; then
	/sbin/busybox echo "deadline" > /sys/block/mmcblk0/queue/scheduler
    fi;

    if /sbin/busybox [ -f /system/.cyanus/vr ]; then
	/sbin/busybox echo "vr" > /sys/block/mmcblk0/queue/scheduler
    fi;

    if /sbin/busybox [ -f /system/.cyanus/noop ]; then
	/sbin/busybox echo "noop" > /sys/block/mmcblk0/queue/scheduler
    fi;
#
/sbin/busybox chmod 755 /sbin
/sbin/busybox chmod 755 /sbin/busybox

setprop cyanus.ready 1
exit 1

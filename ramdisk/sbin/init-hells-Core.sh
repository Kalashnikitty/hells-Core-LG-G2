#!/sbin/busybox sh

# Now wait for the rom to finish booting up
# (by checking for any android process)
while ! /sbin/busybox pgrep com.android ; do
  sleep 1
done

# System tweaks
. /sbin/systemtweaks.inc

# init.d support
. /sbin/initd.inc


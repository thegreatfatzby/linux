set -e
KVER=$(make -s kernelrelease)
echo "Kernel version: $KVER"

sudo update-initramfs -c -k "$KVER"
ls -l /boot/initrd.img-$KVER
CMDLINE="$(cat /proc/cmdline)"
sudo kexec -l arch/x86/boot/bzImage \
  --type=bzImage \
  --initrd=/boot/initrd.img-$KVER \
  --command-line="$CMDLINE"
echo "sync"
sudo sync
echo "kexec"
sudo kexec -e

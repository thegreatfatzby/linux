#make and install
set -e
echo "make"
make -j192 LLVM=1
echo "install modules"
make modules_install
echo "install k"
make install
echo "output boot, will ls, check times against current date (output one line below)"
ls -laFhtr /boot
date
echo "done?"

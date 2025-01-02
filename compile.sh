mkdir -p bin

nasm pico200.s -o bin/pico200.bin -fbin

dd if=/dev/zero of=bin/disk.img bs=512 count=2880
dd if=bin/pico200.bin of=bin/disk.img bs=512 seek=0 conv=notrunc
dd if=program.p200 of=bin/disk.img bs=512 seek=1 conv=notrunc

qemu-system-x86_64 -drive file=bin/disk.img,format=raw

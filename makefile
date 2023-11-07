boot.bin: boot.S
	nasm -f bin boot.S -o boot.bin

boot.img: boot.bin
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc

debug: boot.img
	qemu-system-x86_64 boot.img

.PHONY: clean
clean: 
	rm -rf boot.bin boot.img
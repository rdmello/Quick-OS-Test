
# Default make target
.PHONY: all
all: os-image

# Build the os disk image for qemu with bootloader and kernel
os-image: boot_sect.bin kernel.bin
	cat $^ > os-image

# Build the kernel binary
kernel.bin: kernel_entry.o kernel.o
	ld -o kernel.bin -Ttext 0x1000 $^ --oformat binary

# Build the kernel object file
kernel.o: kernel.c
	gcc -ffreestanding -c $< -o $@

# Build the kernel entry object file
kernel_entry.o: kernel_entry.asm
	nasm $< -f elf64 -o $@

# Assemble the boot sector to raw machine code
boot_sect.bin: boot_sect.asm
	nasm $< -f bin -I '../utils/' -o $@

.PHONY: run
run:
	qemu-system-i386 -drive format=raw,file=os-image

.PHONY: clean
clean:
	rm *.bin *.o

# Disassemble the kernel - useful for debugging
kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

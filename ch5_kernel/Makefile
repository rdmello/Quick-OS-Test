
# Automatically match C source files
C_SOURCES = $(wildcard kernel/*.c drivers/*.c)
HEADERS = $(wildcard kernel/*.h drivers/*.h)

# list of object files to build
OBJ = ${C_SOURCES:.c=.o}

# Default make target
.PHONY: all
all: os-image

# Build the os disk image for qemu with bootloader and kernel
os-image: boot/boot_sect.bin kernel.bin
	cat $^ > os-image

# Build the kernel binary
kernel.bin: kernel/kernel_entry.o ${OBJ}
	ld -o $@ -Ttext 0x1000 $^ --oformat binary

# Generic rule for building 'somefile.o' from 'somefile.c'
%.o: %.c
	gcc -ffreestanding -c $< -o $@

# Build the kernel object file
# kernel.o: kernel.c
# 	gcc -ffreestanding -c $< -o $@

# Build the kernel entry object file
%.o: %.asm
	nasm $< -f elf64 -o $@

# Assemble the boot sector to raw machine code
%.bin: %.asm
	nasm $< -f bin -I '../utils/' -o $@

.PHONY: run
run:
	qemu-system-i386 -drive format=raw,file=os-image

.PHONY: clean
clean:
	rm -fr ./*.bin ./*.dis ./*.o os-image
	rm -fr ./kernel/*.o ./boot/*.bin ./drivers/*.o

# Disassemble the kernel - useful for debugging
kernel.dis: kernel.bin
	ndisasm -b 32 $< > $@

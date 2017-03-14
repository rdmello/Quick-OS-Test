

nasm hello.asm -f bin -o hello.bin

qemu-system-i386 hello.bin

qemu-system-i386 -drive format=raw,file=memory_x.bin

make run file=hello

Errata in PDF file: 

Page 29, CH3: mov dh, 5 should be changed to mov dh, 2
Page 32, CH4: je done -> je print_string_pm_done
Page 46, CH5: caller and callee fcns should be switched


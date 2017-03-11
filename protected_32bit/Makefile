
test_pm.bin : test_pm.asm
	nasm test_pm.asm -f bin -o test_pm.bin

# hello.bin: hello.asm
# 	nasm hello.asm -f bin -o hello.bin
# 
# conditional_if_else.bin: conditional_if_else.asm
# 	nasm conditional_if_else.asm -f bin -o conditional_if_else.bin
# 
# function_test.bin: function_test.asm
# 	nasm function_test.asm -f bin -o function_test.bin
# 
# memory_x.bin: memory_x.asm
# 	nasm memory_x.asm -f bin -o memory_x.bin
# 
# stack_pointer.bin: stack_pointer.asm
# 	nasm stack_pointer.asm -f bin -o stack_pointer.bin

.PHONY: clean
clean:
	rm ./*.bin

.PHONY: run
run:
	nasm $(file).asm -f bin -o $(file).bin
	qemu-system-i386 -drive format=raw,file=$(file).bin

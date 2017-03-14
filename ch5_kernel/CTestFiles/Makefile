
.PHONY: CFILES
CFILES = $(shell ls ./*.c)
$(info $(CFILES))

.PHONY: OFILES
OFILES = $(CFILES:.c=.o)

.PHONY: BINFILES
BINFILES = $(OFILES:.o=.bin)

.PHONY: DISFILES
DISFILES = $(BINFILES:.bin=.dis)

.PHONY: all
all: $(OFILES) $(BINFILES) $(DISFILES)

%.bin: %.o
	ld -o $@ -Ttext 0x0 --oformat binary $<

%.o: %.c
	gcc -ffreestanding -c $< -o $@

%.dis: %.bin
	ndisasm -b 32 $< > $@

# basic.o: basic.c
# 	gcc -ffreestanding -c basic.c -o basic.o
# 
# basic.bin: basic.o
# 	ld -o basic.bin -Ttext 0x0 --oformat binary basic.o
# 
# basic.dis: basic.bin
# 	ndisasm -b 32 basic.bin > basic.dis

.PHONY: clean
clean: 
	rm ./*.bin
	rm ./*.o
	rm ./*.dis



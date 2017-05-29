bootrom_img = bootrom.img

ARCH=riscv32-unknown-elf
GCC=$(ARCH)-gcc
OBJCOPY=$(ARCH)-objcopy

all: $(bootrom_img)

%.img: %.bin
	dd if=$< of=$@ bs=128 count=1

%.bin: %.elf
	$(OBJCOPY) -O binary $< $@

%.elf: %.S linker.ld
	$(GCC) -Tlinker.ld $< -nostdlib -static -Wl,--no-gc-sections -o $@

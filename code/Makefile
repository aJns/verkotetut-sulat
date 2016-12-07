CC = xtensa-lx106-elf-gcc
CFLAGS = -I. -mlongcalls
LDLIBS = -nostdlib -Wl,--start-group -lmain -lnet80211 -lwpa -llwip -lpp -lphy -lc -Wl,--end-group -lgcc
LDFLAGS = -Teagle.app.v6.ld

vilkutin-0x00000.bin: vilkutin
	esptool.py elf2image $^

vilkutin: vilkutin.o

vilkutin.o: vilkutin.c

flash: vilkutin-0x00000.bin
	esptool.py write_flash 0 vilkutin-0x00000.bin 0x10000 vilkutin-0x10000.bin

clean:
	rm -f vilkutin vilkutin.o vilkutin-0x00000.bin vilkutin-0x10000.bin

CC = xtensa-lx106-elf-gcc
CFLAGS = -I. -I./driver_lib/include -mlongcalls -DICACHE_FLASH
LDLIBS = -nostdlib -Wl,--start-group -lmain -lnet80211 -lwpa -llwip -lpp -lphy -lc -lssl -Wl,--end-group -lgcc -L./driver_lib -ldriver
LDFLAGS = -Teagle.app.v6.ld

vilkutin-0x00000.bin: vilkutin
	esptool.py elf2image $^

vilkutin: vilkutin.o

vilkutin.o: vilkutin.c

flash: vilkutin-0x00000.bin
	esptool.py write_flash 0 vilkutin-0x00000.bin 0x10000 vilkutin-0x10000.bin

clean:
	rm -f vilkutin.bin vilkutin.o vilkutin-0x00000.bin vilkutin-0x10000.bin

default: exe

CFLAGS=-Wall -Wextra -masm=intel
PWD=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

clean:
	rm -f libc.so libc.o exe.o exe

exe: exe.o libc.so
	ld \
	--entry main \
	--library-path=$(PWD) \
	-l:libc.so \
	-rpath=$(PWD) \
	--dynamic-linker=/lib/ld-linux-x86-64.so.2 \
	exe.o \
	-o exe

exe.o: exe.c
	gcc $(CFLAGS) -c exe.c -o exe.o

libc.so: libc.o
	ld -shared libc.o -o libc.so

libc.o: libc.c
	gcc $(CFLAGS) -c libc.c -o libc.o

.PHONY: run clean

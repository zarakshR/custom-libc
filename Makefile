CFLAGS=-Wall -Wextra -masm=intel
PWD=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
LD_LINUX_PATH=/lib/ld-linux-x86-64.so.2

default: exe

clean:
	rm -f libc.so libc.o exe.o exe

exe: exe.o libc.so
	ld \
	--entry main \
	--library-path=$(PWD) \
	--library=:libc.so \
	-rpath=$(PWD) \
	--dynamic-linker=$(LD_LINUX_PATH) \
	exe.o \
	-o $@

exe.o: exe.c
	gcc $(CFLAGS) -c $^ -o $@

libc.so: libc.o
	ld -shared $^ -o $@

libc.o: libc.c
	gcc $(CFLAGS) -c $^ -o $@

.PHONY: run clean

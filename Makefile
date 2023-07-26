CFLAGS=-Wall -Wextra -O2 -masm=intel
PWD=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
LD_LINUX_PATH=/lib/ld-linux-x86-64.so.2

default: program

clean:
	rm -f libc.so libc.o program.o program

program: program.o libc.so
	ld \
	--entry main \
	--library-path=$(PWD) \
	--library=:libc.so \
	-rpath=$(PWD) \
	--dynamic-linker=$(LD_LINUX_PATH) \
	program.o \
	-o $@

program.o: program.c
	gcc $(CFLAGS) -c $^ -o $@

libc.so: libc.o
	ld -shared $^ -o $@

libc.o: libc.c
	gcc $(CFLAGS) -c $^ -o $@

.PHONY: run clean

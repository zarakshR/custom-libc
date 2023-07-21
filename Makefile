P=exe
L=libc
ENTRY=main

CFLAGS=-Wall -Wextra -masm=intel
PWD=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
LD_LINUX_PATH=/lib/ld-linux-x86-64.so.2

default: $(P)

clean:
	rm -f $(L).so $(L).o $(P).o $(P)

$(P): $(P).o $(L).so
	ld \
	--entry $(ENTRY) \
	--library-path=$(PWD) \
	--library=:$(L).so \
	-rpath=$(PWD) \
	--dynamic-linker=$(LD_LINUX_PATH) \
	$(P).o \
	-o $(P)

$(P).o: $(P).c
	gcc $(CFLAGS) -c $(P).c -o $(P).o

$(L).so: $(L).o
	ld -shared $(L).o -o $(L).so

$(L).o: $(L).c
	gcc $(CFLAGS) -c $(L).c -o $(L).o

.PHONY: run clean

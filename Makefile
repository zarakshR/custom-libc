PROGRAM=exe
LIBRARY=libc
PROGRAM_OBJECT=$(PROGRAM).o
LIBRARY_OBJECT=$(LIBRARY).o
LIBRARY_SHARED_OBJECT=$(LIBRARY).so
ENTRY=main

CFLAGS=-Wall -Wextra -masm=intel
PWD=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
LD_LINUX_PATH=/lib/ld-linux-x86-64.so.2

default: $(PROGRAM)

clean:
	rm -f $(LIBRARY_SHARED_OBJECT) $(LIBRARY_OBJECT) $(PROGRAM_OBJECT) $(PROGRAM)

$(PROGRAM): $(PROGRAM_OBJECT) $(LIBRARY_SHARED_OBJECT)
	ld \
	--entry $(ENTRY) \
	--library-path=$(PWD) \
	--library=:$(LIBRARY_SHARED_OBJECT) \
	-rpath=$(PWD) \
	--dynamic-linker=$(LD_LINUX_PATH) \
	$(PROGRAM_OBJECT) \
	-o $@

$(PROGRAM_OBJECT): $(PROGRAM).c
	gcc $(CFLAGS) -c $^ -o $@

$(LIBRARY_SHARED_OBJECT): $(LIBRARY_OBJECT)
	ld -shared $^ -o $@

$(LIBRARY_OBJECT): $(LIBRARY).c
	gcc $(CFLAGS) -c $^ -o $@

.PHONY: run clean

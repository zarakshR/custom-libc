run: exe libc.so
	./exe

clean:
	rm -f libc.so libc.o exe.o exe

exe: exe.o libc.so
	ld --entry main exe.o -L . -l:libc.so -o exe

exe.o: exe.c
	gcc -Wall -Wextra -c exe.c -o exe.o

libc.so: libc.o
	ld -shared libc.o -o libc.so

libc.o: libc.c
	gcc -Wall -Wextra -fPIC -c libc.c -o libc.o

.PHONY: run clean

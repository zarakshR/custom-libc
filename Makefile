run: exe mylibc.so
	LD_PRELOAD=/home/zaraksh/ld_preload/mylibc.so ./exe

clean:
	rm -f mylibc.so mylibc.o exe.o exe

exe: exe.o mylibc.so
	ld --entry main exe.o -L . -l:mylibc.so -o exe

exe.o: exe.c
	gcc -Wall -Wextra -masm=intel -c exe.c -o exe.o

mylibc.so: mylibc.o
	ld -shared mylibc.o -o mylibc.so

mylibc.o: mylibc.c
	gcc -Wall -Wextra -masm=intel -fPIC -c mylibc.c -o mylibc.o

.PHONY: run clean

run: exe mylib.so
	pwd
	LD_PRELOAD=/home/zaraksh/ld_preload/mylib.so ./exe

clean:
	rm -f mylib.so mylib.o exe.o exe

mylib.so: mylib.o
	ld -shared mylib.o -o mylib.so

mylib.o: mylib.c
	gcc -Wall -Wextra -fPIC -c mylib.c -o mylib.o

exe: exe.o mylib.so
	ld --entry main exe.o -L . -lc -o exe

exe.o: exe.c
	gcc -Wall -Wextra -c exe.c -o exe.o

.PHONY: run clean

#include "libc.h"

char msg[] = "Hello, World!\n";

int main() {
    read(0, msg, 15);
    write(1, msg, 15);
    exit(40);
}

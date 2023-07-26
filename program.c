#include "libc.h"

int main() {
    syscall(3, 0, 0, 0, 0, 0, 0);
    syscall(3, 1, 0, 0, 0, 0, 0);
    syscall(3, 2, 0, 0, 0, 0, 0);
    syscall(60, 42, 0, 0, 0, 0, 0);
}

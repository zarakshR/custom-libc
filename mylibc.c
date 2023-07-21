int puts(const char * s) {
    asm("mov rax, 60");
    asm("mov rdi, 69");
    asm("syscall");
}

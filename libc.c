#include "libc.h"

long syscall(long NR, long arg1, long arg2, long arg3, long arg4, long arg5, long arg6) {

    asm volatile("mov rax, %[NR]" : : [NR] "rm" (NR) : "rax");
    asm volatile("mov rdi, %[arg1]" : : [arg1] "rm" (arg1) : "rdi");
    asm volatile("mov rsi, %[arg2]" : : [arg2] "rm" (arg2) : "rsi");
    asm volatile("mov rdx, %[arg3]" : : [arg3] "rm" (arg3) : "rdx");
    asm volatile("mov r10, %[arg4]" : : [arg4] "rm" (arg4) : "r10");
    asm volatile("mov r8, %[arg5]" : : [arg5] "rm" (arg5) : "r8");
    asm volatile("mov r9, %[arg6]" : : [arg6] "rm" (arg6) : "r9");
    asm volatile("syscall");

    long retval;
    asm volatile("mov %[retval], rcx" : [retval] "=r" (retval));

    return retval;
}

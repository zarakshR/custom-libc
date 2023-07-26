#include "libc.h"

long syscall(long NR, long arg1, long arg2, long arg3, long arg4, long arg5, long arg6) {

    long retval;

    asm volatile(
        "mov rax, %[NR] \n"
        "mov rdi, %[arg1] \n"
        "mov rsi, %[arg2] \n"
        "mov rdx, %[arg3] \n"
        "mov r10, %[arg4] \n"
        "mov r8, %[arg5] \n"
        "mov r9, %[arg6] \n"
        "syscall \n"
        "mov %[retval], rcx"
        :
        [retval] "=r" (retval)
        :
        [NR] "rm" (NR),
        [arg1] "rm" (arg1),
        [arg2] "rm" (arg2),
        [arg3] "rm" (arg3),
        [arg4] "rm" (arg4),
        [arg5] "rm" (arg5),
        [arg6] "rm" (arg6)
        : 
        "rax",
        "rdi",
        "rsi",
        "rdx",
        "r10",
        "r8",
        "r9"
        );

    return retval;
}

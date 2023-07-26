typedef long int ssize_t;
typedef long unsigned int size_t;

long syscall(long, long, long, long, long, long, long);

ssize_t read(int fd, void * buf, size_t count);
ssize_t write(int fd, void * buf, size_t count);
int close(int fd);
void exit(int status);

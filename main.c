
#include <stdint-gcc.h>

void kernel_main()__attribute__ ((section (".text.init")));
int  tst(int a, int b, int c);


// void __attribute__((naked))kernel_main()
void kernel_main()
{
    // volatile uint16_t* p = (uint16_t*)0xe0000000;
    volatile uint16_t* p = (uint16_t*)0xb8000;

    while(1) {
        (*p)++;
        int q = tst(*(p+1),*(p+2),*p);
        *p = q;
        // p++;
    }
}

int __attribute__((noinline))tst(int a, int b, int c)
{
   return a+b+c;
}

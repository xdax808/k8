
#include <stdint-gcc.h>

void __attribute__((naked))kernel_main()
{
    // volatile uint16_t* p = (uint16_t*)0xe0000000;
    volatile uint16_t* p = (uint16_t*)0xb8000;

    while(1) {
        (*p)++;
    }
}

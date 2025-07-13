
#include <stdint-gcc.h>


void __attribute__((naked))_main()
{
    volatile uint16_t* p = (uint16_t*)0xe0000000;

    while(1) {
        (*p)++;
    }
}

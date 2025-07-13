ENTRY(kernel_main)

SECTIONS
{
    /* Der Kernel soll ab physischer Adresse 1 MiB starten */
    . = 0x00100000;

    .text :
    {
        *(.text.init)
        . = ALIGN(0x100);
        *(.text*)
    }

    .rodata :
    {
        *(.rodata*)
    }

    .data :
    {
        *(.data*)
    }

    .bss :
    {
        *(.bss*)
        *(COMMON)
    }
}

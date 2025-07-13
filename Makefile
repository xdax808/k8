# Compiler und Pfade

export PATH := $(HOME)/opt/cross/bin/:$(PATH)

#CROSS_COMPILER = $(HOME)/opt/cross/bin/x86_64-elf-gcc
PREFIX = x86_64-elf-
CROSS_COMPILER = $(PREFIX)gcc
ODUMP = objdump

CFLAGS = -std=gnu99 -ffreestanding -Wall -Wextra
CFLAGS  += -O2
LDFLAGS = -T linker.ld -nostdlib

# Zielname
TARGET = kernel.elf

# Quelldateien und Objektdateien
SRCS = main.c
OBJS = $(SRCS:.c=.o)

# Standard-Ziel
all: $(TARGET)

# Ziel-Build
$(TARGET): $(OBJS)
	$(CROSS_COMPILER) $(LDFLAGS) -o $@ $^
	$(ODUMP) -d $@ > kernel.dis

# Kompiliere .c zu .o
%.o: %.c
	$(CROSS_COMPILER) $(CFLAGS) -c $< -o $@

# Clean-Target
clean:
	rm -f $(OBJS) $(TARGET)

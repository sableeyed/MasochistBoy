#ifndef CARTRIDGE_H
#define CARTRIDGE_H

#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>

typedef struct cartridge_t {
    uint8_t *title;
    uint8_t *rom;
    uint32_t size;
} cartridge_t;

cartridge_t *load_cartridge(char *filename);
void free_cartridge(cartridge_t *cartridge);

#endif
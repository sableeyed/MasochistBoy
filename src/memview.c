#include "memview.h"

void hex_dump(const void *data, size_t size) {
    const unsigned char *byte = (const unsigned char *)data;
    for (size_t i = 0; i < size; i += 16) {
        printf("%08zx  ", i);
        // Hex part
        for (size_t j = 0; j < 16; ++j) {
            if (i + j < size)
                printf("%02x ", byte[i + j]);
            else
                printf("   ");
        }
        printf(" ");
        // ASCII part
        for (size_t j = 0; j < 16; ++j) {
            if (i + j < size)
                printf("%c", isprint(byte[i + j]) ? byte[i + j] : '.');
        }
        printf("\n");
    }
}
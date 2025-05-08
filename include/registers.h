#ifndef REGISTERS_H
#define REGISTERS_H

#include <stdint.h>

/*s
 * I am not entirely sure exactly how a union struct works. This suggestion was from
 * chat jippity + existing source code from Cinoop, but the implementation is a bit different
 * it can always be changed later, this is a learning project of course!
*/

typedef union {
    struct {
      uint8_t f;
      uint8_t a;
    };
    uint16_t af;
} AFRegister;

typedef union {
    struct {
      uint8_t c;
      uint8_t b;
    };
    uint16_t bc;
} BCRegister;

typedef union {
    struct {
      uint8_t e;
      uint8_t d;
    };
    uint16_t de;
} DERegister;

typedef union {
    struct {
      uint8_t l;
      uint8_t h;
    };
    uint16_t hl;
} HLRegister;

typedef struct {
    AFRegister af;
    BCRegister bc;
    DERegister de;
    HLRegister hl;
    uint16_t sp;
    uint16_t pc;
} CPURegisters;

#endif // REGISTERS_H
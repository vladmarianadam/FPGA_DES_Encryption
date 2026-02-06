#define DES_TB_H

#include "ap_int.h"
#include "des.h"

//============================================================
// Type Definitions
//============================================================
typedef ap_uint<64> block_t;      // 64-bit data block

//============================================================
// Function Prototypes
//============================================================
void des_encrypt(block_t plaintext, block_t key, block_t *ciphertext);
void des_decrypt(block_t ciphertext, block_t key, block_t *plaintext);
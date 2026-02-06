#include "des.h"

//============================================================
// Helper function: Apply a permutation table
// DES tables use 1-based indexing (bit 1 is MSB)
// ap_uint uses 0-based indexing (bit 0 is LSB)
//============================================================

// Apply initial permutation (64-bit)
static block_t apply_IP(block_t input) {
    #pragma HLS INLINE
    block_t output = 0;
    
    IP_LOOP: for (int i = 0; i < 64; i++) {
        #pragma HLS UNROLL
        // IP[i] gives 1-based position in input
        // We want: output bit (63-i) = input bit (64-IP[i])
        int src_bit = 64 - IP[i];  // Convert to 0-based, MSB=63
        int dst_bit = 63 - i;       // Output position
        output[dst_bit] = input[src_bit];
    }
    return output;
}

// Apply final permutation (64-bit)
static block_t apply_FP(block_t input) {
    #pragma HLS INLINE
    block_t output = 0;
    
    FP_LOOP: for (int i = 0; i < 64; i++) {
        #pragma HLS UNROLL
        int src_bit = 64 - FP[i];
        int dst_bit = 63 - i;
        output[dst_bit] = input[src_bit];
    }
    return output;
}

// Expansion: 32 bits to 48 bits
static key48_t expand(half_t input) {
    #pragma HLS INLINE
    key48_t output = 0;
    
    E_LOOP: for (int i = 0; i < 48; i++) {
        #pragma HLS UNROLL
        int src_bit = 32 - E[i];   // 1-based to 0-based for 32-bit
        int dst_bit = 47 - i;       // Output position
        output[dst_bit] = input[src_bit];
    }
    return output;
}

// P-box permutation: 32 bits to 32 bits
static half_t permute_P(half_t input) {
    #pragma HLS INLINE
    half_t output = 0;
    
    P_LOOP: for (int i = 0; i < 32; i++) {
        #pragma HLS UNROLL
        int src_bit = 32 - P[i];
        int dst_bit = 31 - i;
        output[dst_bit] = input[src_bit];
    }
    return output;
}

// S-box substitution: 48 bits to 32 bits
static half_t sbox_substitute(key48_t input) {
    #pragma HLS INLINE
    #pragma HLS ARRAY_PARTITION variable=SBOX complete dim=0
    
    half_t output = 0;
    
    SBOX_LOOP: for (int box = 0; box < 8; box++) {
        #pragma HLS UNROLL
        
        // Extract 6 bits for this S-box
        // Box 0 uses bits 47-42, box 1 uses 41-36, etc.
        int high_bit = 47 - (box * 6);
        int low_bit = 42 - (box * 6);
        
        ap_uint<6> six_bits = input.range(high_bit, low_bit);
        
        // Row = outer bits (bit 5 and bit 0)
        ap_uint<2> row;
        row[1] = six_bits[5];
        row[0] = six_bits[0];
        
        // Column = inner bits (bits 4-1)
        ap_uint<4> col = six_bits.range(4, 1);
        
        // S-box lookup
        ap_uint<4> sbox_out = SBOX[box][(int)row][(int)col];
        
        // Place 4-bit result in output
        // Box 0 outputs to bits 31-28, box 1 to 27-24, etc.
        int out_high = 31 - (box * 4);
        int out_low = 28 - (box * 4);
        output.range(out_high, out_low) = sbox_out;
    }
    return output;
}

// Feistel function f(R, K)
static half_t feistel(half_t R, key48_t subkey) {
    #pragma HLS INLINE
    
    // Step 1: Expand R from 32 to 48 bits
    key48_t expanded = expand(R);
    
    // Step 2: XOR with subkey
    key48_t xored = expanded ^ subkey;
    
    // Step 3: S-box substitution (48 to 32 bits)
    half_t substituted = sbox_substitute(xored);
    
    // Step 4: P-box permutation
    half_t permuted = permute_P(substituted);
    
    return permuted;
}

// Left circular shift for 28-bit key halves
static keyhalf_t left_rotate(keyhalf_t input, int shift) {
    #pragma HLS INLINE
    keyhalf_t output;
    if (shift == 1) {
        // Rotate left by 1: bit 27 wraps to bit 0
        output.range(27, 1) = input.range(26, 0);
        output[0] = input[27];
    } else {
        // Rotate left by 2: bits 27,26 wrap to bits 1,0
        output.range(27, 2) = input.range(25, 0);
        output[1] = input[27];
        output[0] = input[26];
    }
    return output;
}

// Generate all 16 subkeys from the 64-bit key
static void generate_subkeys(block_t key, key48_t subkeys[16]) {
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=subkeys complete
    
    // Step 1: Apply PC-1 to extract 56 bits
    key56_t key56 = 0;
    PC1_LOOP: for (int i = 0; i < 56; i++) {
        #pragma HLS UNROLL
        int src_bit = 64 - PC1[i];
        int dst_bit = 55 - i;
        key56[dst_bit] = key[src_bit];
    }
    
    // Step 2: Split into C and D (28 bits each)
    keyhalf_t C = key56.range(55, 28);
    keyhalf_t D = key56.range(27, 0);
    
    // Step 3: Generate 16 subkeys
    KEYGEN_LOOP: for (int round = 0; round < 16; round++) {
        #pragma HLS UNROLL
        
        // Left rotate C and D
        C = left_rotate(C, LEFT_SHIFTS[round]);
        D = left_rotate(D, LEFT_SHIFTS[round]);
        
        // Combine C and D
        key56_t CD;
        CD.range(55, 28) = C;
        CD.range(27, 0) = D;
        
        // Apply PC-2 to get 48-bit subkey
        key48_t subkey = 0;
        PC2_LOOP: for (int i = 0; i < 48; i++) {
            #pragma HLS UNROLL
            int src_bit = 56 - PC2[i];
            int dst_bit = 47 - i;
            subkey[dst_bit] = CD[src_bit];
        }
        subkeys[round] = subkey;
    }
}

// Core DES processing (used by both encrypt and decrypt)
static block_t des_core(block_t input, key48_t subkeys[16], bool decrypt) {
    #pragma HLS INLINE off
    #pragma HLS ARRAY_PARTITION variable=subkeys complete
    
    // Step 1: Initial permutation
    block_t permuted = apply_IP(input);
    
    // Step 2: Split into L and R halves
    half_t L = permuted.range(63, 32);
    half_t R = permuted.range(31, 0);
    
    // Step 3: 16 Feistel rounds
    ROUNDS_LOOP: for (int round = 0; round < 16; round++) {
        #pragma HLS UNROLL
        
        // Select subkey (forward for encrypt, reverse for decrypt)
        int key_index = decrypt ? (15 - round) : round;
        key48_t round_key = subkeys[key_index];
        
        // Feistel round: L' = R, R' = L XOR f(R, K)
        half_t new_R = L ^ feistel(R, round_key);
        L = R;
        R = new_R;
    }
    
    // Step 4: Combine (note: R and L are swapped) R16||L16
    block_t preoutput;
    preoutput.range(63, 32) = R;
    preoutput.range(31, 0) = L;
    
    // Step 5: Final permutation
    block_t output = apply_FP(preoutput);
    
    return output;
}

//============================================================
// Top-level DES encryption function
//============================================================
void des_encrypt(block_t plaintext, block_t key, block_t *ciphertext) {
    #pragma HLS INTERFACE mode=ap_ctrl_hs port=return
    #pragma HLS INTERFACE mode=ap_none port=plaintext
    #pragma HLS INTERFACE mode=ap_none port=key
    #pragma HLS INTERFACE mode=ap_vld port=ciphertext
    
    // Generate subkeys
    key48_t subkeys[16];
    #pragma HLS ARRAY_PARTITION variable=subkeys complete
    generate_subkeys(key, subkeys);
    
    // Encrypt (subkeys in forward order)
    *ciphertext = des_core(plaintext, subkeys, false);
}

//============================================================
// Top-level DES decryption function
//============================================================
void des_decrypt(block_t ciphertext, block_t key, block_t *plaintext) {
    #pragma HLS INTERFACE mode=ap_ctrl_hs port=return
    #pragma HLS INTERFACE mode=ap_none port=ciphertext
    #pragma HLS INTERFACE mode=ap_none port=key
    #pragma HLS INTERFACE mode=ap_vld port=plaintext
    
    // Generate subkeys
    key48_t subkeys[16];
    #pragma HLS ARRAY_PARTITION variable=subkeys complete
    generate_subkeys(key, subkeys);
    
    // Decrypt (subkeys in reverse order)
    *plaintext = des_core(ciphertext, subkeys, true);
}
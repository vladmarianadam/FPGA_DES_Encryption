#include <ap_int.h>

typedef ap_uint<32> u32;

// Functia auxiliara pentru o runda (Quarter Round)
void qr(u32 &a, u32 &b, u32 &c, u32 &d) {
    #pragma HLS INLINE
    a += b; d ^= a; d = (d << 16) | (d >> 16);
    c += d; b ^= c; b = (b << 12) | (b >> 20);
    a += b; d ^= a; d = (d << 8)  | (d >> 24);
    c += d; b ^= c; b = (b << 7)  | (b >> 25);
}

void chacha20_kernel(u32 state[16]) {
    // MODIFICARE: Folosim s_axilite pentru a evita eroarea de driver HBM
    #pragma HLS INTERFACE s_axilite port=state bundle=control
    #pragma HLS INTERFACE s_axilite port=return bundle=control
    
    // Optimizare: accesam toate elementele matricei in paralel
    #pragma HLS ARRAY_PARTITION variable=state complete

    for (int i = 0; i < 10; i++) {
        #pragma HLS UNROLL
        // Runde pe coloane
        qr(state[0], state[4], state[8],  state[12]);
        qr(state[1], state[5], state[9],  state[13]);
        qr(state[2], state[6], state[10], state[14]);
        qr(state[3], state[7], state[11], state[15]);
        // Runde pe diagonale
        qr(state[0], state[5], state[10], state[15]);
        qr(state[1], state[6], state[11], state[12]);
        qr(state[2], state[7], state[8],  state[13]);
        qr(state[3], state[4], state[9],  state[14]);
    }
}
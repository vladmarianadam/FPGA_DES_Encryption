#include <iostream>
#include <ap_int.h>

// Declaram functia pe care o testam
void chacha20_kernel(ap_uint<32> state[16]);

int main() {
    ap_uint<32> state[16];
    
    // Initializam matricea cu valori de test
    for(int i=0; i<16; i++) state[i] = i;

    std::cout << "--- Incepe Simularea ---" << std::endl;
    
    chacha20_kernel(state);

    // Afisam primele valori rezultate
    for(int i=0; i<4; i++) {
        std::cout << "State[" << i << "] = " << std::hex << state[i] << std::endl;
    }

    return 0;
}
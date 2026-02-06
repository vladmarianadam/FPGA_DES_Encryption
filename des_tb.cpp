//============================================================
// DES Testbench for Vitis HLS
// Test vectors verified against known implementations
//============================================================
#include <iostream>
#include <iomanip>
#include "des_tb.h"

using namespace std;

// Test vector structure
struct TestVector {
    unsigned long long key;
    unsigned long long plaintext;
    unsigned long long ciphertext;
    const char* description;
};

// Verified test vectors
// Source: Various DES validation documents and known implementations
const TestVector test_vectors[] = {
    // Key: 133457799BBCDFF1, Plaintext: 0123456789ABCDEF
    // Ciphertext: 85E813540F0AB405
    {0x133457799BBCDFF1ULL, 0x0123456789ABCDEFULL, 0x85E813540F0AB405ULL, 
     "Grabbe example"},
    
    // Additional standard test vectors
    {0x0E329232EA6D0D73ULL, 0x8787878787878787ULL, 0x0000000000000000ULL,
     "Zero ciphertext test"},
    
    // Classic FIPS test vector 
    {0xFEDCBA9876543210ULL, 0x0123456789ABCDEFULL, 0xED39D950FA74BCC4ULL,
     "Classic FIPS vector"},
     
    {0xFEDCBA9876543210ULL, 0x0123456789ABCDEFULL, 0xED39D950FA74BCC4ULL,
     "Classic test vector"},
};

const int NUM_TESTS = sizeof(test_vectors) / sizeof(TestVector);

// Helper to print 64-bit hex
void print_hex(const char* label, unsigned long long value) {
    cout << label << ": 0x" << hex << uppercase << setw(16) << setfill('0') << value << dec << endl;
}

int main() {
    int errors = 0;
    block_t result;
    
    cout << "========================================" << endl;
    cout << "DES Implementation Testbench" << endl;
    cout << "Target: Artix-7 xc7a100tcsg324-1" << endl;
    cout << "========================================" << endl << endl;
    
    //--------------------------------------------------
    // Test Encryption
    //--------------------------------------------------
    cout << "--- ENCRYPTION TESTS ---" << endl;
    
    for (int i = 0; i < NUM_TESTS; i++) {
        block_t pt = test_vectors[i].plaintext;
        block_t k = test_vectors[i].key;
        block_t expected_ct = test_vectors[i].ciphertext;
        
        des_encrypt(pt, k, &result);
        
        cout << "\nTest " << (i+1) << ": " << test_vectors[i].description << endl;
        print_hex("  Key       ", (unsigned long long)k);
        print_hex("  Plaintext ", (unsigned long long)pt);
        print_hex("  Expected  ", (unsigned long long)expected_ct);
        print_hex("  Got       ", (unsigned long long)result);
        
        if (result != expected_ct) {
            cout << "  *** FAIL ***" << endl;
            errors++;
        } else {
            cout << "  PASS" << endl;
        }
    }
    
    //--------------------------------------------------
    // Test Decryption
    //--------------------------------------------------
    cout << endl << "--- DECRYPTION TESTS ---" << endl;
    
    for (int i = 0; i < NUM_TESTS; i++) {
        block_t ct = test_vectors[i].ciphertext;
        block_t k = test_vectors[i].key;
        block_t expected_pt = test_vectors[i].plaintext;
        
        des_decrypt(ct, k, &result);
        
        cout << "\nTest " << (i+1) << ": " << test_vectors[i].description << endl;
        print_hex("  Key       ", (unsigned long long)k);
        print_hex("  Ciphertext", (unsigned long long)ct);
        print_hex("  Expected  ", (unsigned long long)expected_pt);
        print_hex("  Got       ", (unsigned long long)result);
        
        if (result != expected_pt) {
            cout << "  *** FAIL ***" << endl;
            errors++;
        } else {
            cout << "  PASS" << endl;
        }
    }
    
    //--------------------------------------------------
    // Round-trip Test
    //--------------------------------------------------
    cout << endl << "--- ROUND-TRIP TEST ---" << endl;
    
    block_t original = 0xDEADBEEFCAFEBABEULL;
    block_t test_key = 0x133457799BBCDFF1ULL;
    block_t encrypted, decrypted;
    
    des_encrypt(original, test_key, &encrypted);
    des_decrypt(encrypted, test_key, &decrypted);
    
    print_hex("  Original  ", (unsigned long long)original);
    print_hex("  Encrypted ", (unsigned long long)encrypted);
    print_hex("  Decrypted ", (unsigned long long)decrypted);
    
    if (decrypted == original) {
        cout << "  Round-trip PASS" << endl;
    } else {
        cout << "  Round-trip FAIL" << endl;
        errors++;
    }
    
    //--------------------------------------------------
    // Summary
    //--------------------------------------------------
    cout << endl << "========================================" << endl;
    int total_tests = NUM_TESTS * 2 + 1;
    cout << "Results: " << (total_tests - errors) << "/" << total_tests << " tests passed" << endl;
    
    if (errors == 0) {
        cout << "*** ALL TESTS PASSED ***" << endl;
    } else {
        cout << "*** " << errors << " TESTS FAILED ***" << endl;
    }
    cout << "========================================" << endl;
    
    // Return 0 for success, non-zero for failure (important for HLS)
    return errors;
}
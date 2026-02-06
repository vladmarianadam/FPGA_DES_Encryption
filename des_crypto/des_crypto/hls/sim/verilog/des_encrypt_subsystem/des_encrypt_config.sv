//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef DES_ENCRYPT_CONFIG__SV                        
    `define DES_ENCRYPT_CONFIG__SV                    
                                                            
    class des_encrypt_config extends uvm_object;            
                                                            
        int check_ena;                                      
        int cover_ena;                                      
        svr_pkg::svr_config port_plaintext_cfg;
        svr_pkg::svr_config port_key_cfg;
        svr_pkg::svr_config port_ciphertext_cfg;

        `uvm_object_utils_begin(des_encrypt_config)         
        `uvm_field_object(port_plaintext_cfg, UVM_DEFAULT)
        `uvm_field_object(port_key_cfg, UVM_DEFAULT)
        `uvm_field_object(port_ciphertext_cfg, UVM_DEFAULT)
        `uvm_field_int   (check_ena , UVM_DEFAULT)          
        `uvm_field_int   (cover_ena , UVM_DEFAULT)          
        `uvm_object_utils_end                               

        function new (string name = "des_encrypt_config");
            super.new(name);                                
            port_plaintext_cfg = svr_pkg::svr_config::type_id::create("port_plaintext_cfg");
            port_key_cfg = svr_pkg::svr_config::type_id::create("port_key_cfg");
            port_ciphertext_cfg = svr_pkg::svr_config::type_id::create("port_ciphertext_cfg");
        endfunction                                         
                                                            
    endclass                                                
                                                            
`endif                                                      

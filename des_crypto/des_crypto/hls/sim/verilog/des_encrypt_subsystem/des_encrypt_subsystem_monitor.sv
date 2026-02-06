//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef DES_ENCRYPT_SUBSYSTEM_MONITOR_SV
`define DES_ENCRYPT_SUBSYSTEM_MONITOR_SV

`uvm_analysis_imp_decl(_svr_master_plaintext)
`uvm_analysis_imp_decl(_svr_master_key)
`uvm_analysis_imp_decl(_svr_slave_ciphertext)

class des_encrypt_subsystem_monitor extends uvm_component;

    des_encrypt_reference_model refm;
    des_encrypt_scoreboard scbd;

    `uvm_component_utils_begin(des_encrypt_subsystem_monitor)
    `uvm_component_utils_end

    uvm_analysis_imp_svr_master_plaintext#(svr_pkg::svr_transfer#(64), des_encrypt_subsystem_monitor) svr_master_plaintext_imp;
    uvm_analysis_imp_svr_master_key#(svr_pkg::svr_transfer#(64), des_encrypt_subsystem_monitor) svr_master_key_imp;
    uvm_analysis_imp_svr_slave_ciphertext#(svr_pkg::svr_transfer#(64), des_encrypt_subsystem_monitor) svr_slave_ciphertext_imp;

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(des_encrypt_reference_model)::get(this, "", "refm", refm))
            `uvm_fatal(this.get_full_name(), "No refm from high level")
        `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM)
        scbd = des_encrypt_scoreboard::type_id::create("scbd", this);
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
    endfunction

    function new (string name = "", uvm_component parent = null);
        super.new(name, parent);
        svr_master_plaintext_imp = new("svr_master_plaintext_imp", this);
        svr_master_key_imp = new("svr_master_key_imp", this);
        svr_slave_ciphertext_imp = new("svr_slave_ciphertext_imp", this);
    endfunction

    virtual function void write_svr_master_plaintext(svr_transfer#(64) tr);
        refm.write_svr_master_plaintext(tr);
        scbd.write_svr_master_plaintext(tr);
    endfunction

    virtual function void write_svr_master_key(svr_transfer#(64) tr);
        refm.write_svr_master_key(tr);
        scbd.write_svr_master_key(tr);
    endfunction

    virtual function void write_svr_slave_ciphertext(svr_transfer#(64) tr);
        refm.write_svr_slave_ciphertext(tr);
        scbd.write_svr_slave_ciphertext(tr);
    endfunction
endclass
`endif

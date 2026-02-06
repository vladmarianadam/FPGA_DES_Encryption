//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef DES_ENCRYPT_ENV__SV                                                                                   
    `define DES_ENCRYPT_ENV__SV                                                                               
                                                                                                                    
                                                                                                                    
    class des_encrypt_env extends uvm_env;                                                                          
                                                                                                                    
        des_encrypt_virtual_sequencer des_encrypt_virtual_sqr;                                                      
        des_encrypt_config des_encrypt_cfg;                                                                         
                                                                                                                    
        svr_pkg::svr_env#(64) env_master_svr_plaintext;
        svr_pkg::svr_env#(64) env_master_svr_key;
        svr_pkg::svr_env#(64) env_slave_svr_ciphertext;
                                                                                                                    
        des_encrypt_reference_model   refm;                                                                         
                                                                                                                    
        des_encrypt_subsystem_monitor subsys_mon;                                                                   
                                                                                                                    
        `uvm_component_utils_begin(des_encrypt_env)                                                                 
        `uvm_field_object (env_master_svr_plaintext,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_master_svr_key,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (env_slave_svr_ciphertext,  UVM_DEFAULT | UVM_REFERENCE)
        `uvm_field_object (refm, UVM_DEFAULT | UVM_REFERENCE)                                                       
        `uvm_field_object (des_encrypt_virtual_sqr, UVM_DEFAULT | UVM_REFERENCE)                                    
        `uvm_field_object (des_encrypt_cfg        , UVM_DEFAULT)                                                    
        `uvm_component_utils_end                                                                                    
                                                                                                                    
        function new (string name = "des_encrypt_env", uvm_component parent = null);                              
            super.new(name, parent);                                                                                
        endfunction                                                                                                 
                                                                                                                    
        extern virtual function void build_phase(uvm_phase phase);                                                  
        extern virtual function void connect_phase(uvm_phase phase);                                                
        extern virtual task          run_phase(uvm_phase phase);                                                    
                                                                                                                    
    endclass                                                                                                        
                                                                                                                    
    function void des_encrypt_env::build_phase(uvm_phase phase);                                                    
        super.build_phase(phase);                                                                                   
        des_encrypt_cfg = des_encrypt_config::type_id::create("des_encrypt_cfg", this);                           
                                                                                                                    
        des_encrypt_cfg.port_plaintext_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_plaintext  = svr_env#(64)::type_id::create("env_master_svr_plaintext", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_plaintext*", "cfg", des_encrypt_cfg.port_plaintext_cfg);
        des_encrypt_cfg.port_plaintext_cfg.prt_type = svr_pkg::AP_NONE;
        des_encrypt_cfg.port_plaintext_cfg.is_active = svr_pkg::SVR_ACTIVE;
        des_encrypt_cfg.port_plaintext_cfg.spec_cfg = svr_pkg::NORMAL;
        des_encrypt_cfg.port_plaintext_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        des_encrypt_cfg.port_key_cfg.svr_type = svr_pkg::SVR_MASTER ;
        env_master_svr_key  = svr_env#(64)::type_id::create("env_master_svr_key", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_master_svr_key*", "cfg", des_encrypt_cfg.port_key_cfg);
        des_encrypt_cfg.port_key_cfg.prt_type = svr_pkg::AP_NONE;
        des_encrypt_cfg.port_key_cfg.is_active = svr_pkg::SVR_ACTIVE;
        des_encrypt_cfg.port_key_cfg.spec_cfg = svr_pkg::NORMAL;
        des_encrypt_cfg.port_key_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 
        des_encrypt_cfg.port_ciphertext_cfg.svr_type = svr_pkg::SVR_SLAVE ;
        env_slave_svr_ciphertext  = svr_env#(64)::type_id::create("env_slave_svr_ciphertext", this);
        uvm_config_db#(svr_pkg::svr_config)::set(this, "env_slave_svr_ciphertext*", "cfg", des_encrypt_cfg.port_ciphertext_cfg);
        des_encrypt_cfg.port_ciphertext_cfg.prt_type = svr_pkg::AP_VLD;
        des_encrypt_cfg.port_ciphertext_cfg.is_active = svr_pkg::SVR_ACTIVE;
        des_encrypt_cfg.port_ciphertext_cfg.spec_cfg = svr_pkg::NORMAL;
        des_encrypt_cfg.port_ciphertext_cfg.reset_level = svr_pkg::RESET_LEVEL_HIGH;
 



        refm = des_encrypt_reference_model::type_id::create("refm", this);


        uvm_config_db#(des_encrypt_reference_model)::set(this, "*", "refm", refm);


        `uvm_info(this.get_full_name(), "set reference model by uvm_config_db", UVM_LOW)


        subsys_mon = des_encrypt_subsystem_monitor::type_id::create("subsys_mon", this);


        des_encrypt_virtual_sqr = des_encrypt_virtual_sequencer::type_id::create("des_encrypt_virtual_sqr", this);
        `uvm_info(this.get_full_name(), "build_phase done", UVM_LOW)
    endfunction


    function void des_encrypt_env::connect_phase(uvm_phase phase);
        super.connect_phase(phase);


        des_encrypt_virtual_sqr.svr_port_plaintext_sqr = env_master_svr_plaintext.m_agt.sqr;
        env_master_svr_plaintext.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_plaintext_imp);
 
        des_encrypt_virtual_sqr.svr_port_key_sqr = env_master_svr_key.m_agt.sqr;
        env_master_svr_key.m_agt.mon.item_collect_port.connect(subsys_mon.svr_master_key_imp);
 
        des_encrypt_virtual_sqr.svr_port_ciphertext_sqr = env_slave_svr_ciphertext.s_agt.sqr;
        env_slave_svr_ciphertext.s_agt.mon.item_collect_port.connect(subsys_mon.svr_slave_ciphertext_imp);
 
        refm.des_encrypt_cfg = des_encrypt_cfg;
        `uvm_info(this.get_full_name(), "connect phase done", UVM_LOW)
    endfunction


    task des_encrypt_env::run_phase(uvm_phase phase);
        `uvm_info(this.get_full_name(), "des_encrypt_env is running", UVM_LOW)
    endtask


`endif

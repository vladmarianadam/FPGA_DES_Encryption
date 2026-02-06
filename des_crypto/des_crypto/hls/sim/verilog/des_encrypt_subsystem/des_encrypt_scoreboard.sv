//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`ifndef DES_ENCRYPT_SCOREBOARD__SV                                                       
    `define DES_ENCRYPT_SCOREBOARD__SV                                                   
                                                                                               
    `define AUTOTB_TVOUT_ciphertext_ciphertext_wrapc  "../tv/rtldatafile/rtl.des_encrypt.autotvout_ciphertext.dat"
                                                                                               
    class des_encrypt_scoreboard extends uvm_component;                                        
                                                                                               
        des_encrypt_reference_model refm;                                                      
                                                                                               
        typedef integer TRANS_SIZE_QUEUE_TYPE [$];                                      
        TRANS_SIZE_QUEUE_TYPE TVOUT_transaction_size_queue;                                
        int write_file_done_ciphertext_ciphertext;                                                          
        int write_section_done_ciphertext_ciphertext = 0;                                                   
                                                                                           
        file_agent_pkg::file_write_agent#(64) file_wr_port_ciphertext_ciphertext;
    svr_transfer#(64) ciphertext_apvld_rxtr;
                                                                                               
        `uvm_component_utils_begin(des_encrypt_scoreboard)                                     
        `uvm_field_object(refm  , UVM_DEFAULT)                                                 
        `uvm_field_queue_int(TVOUT_transaction_size_queue, UVM_DEFAULT)                    
        `uvm_field_object(file_wr_port_ciphertext_ciphertext, UVM_DEFAULT)
        `uvm_field_int(write_file_done_ciphertext_ciphertext, UVM_DEFAULT)
        `uvm_field_int(write_section_done_ciphertext_ciphertext, UVM_DEFAULT)
        `uvm_component_utils_end                                                               
                                                                                               
        virtual function void build_phase(uvm_phase phase);                                    
            if (!uvm_config_db #(des_encrypt_reference_model)::get(this, "", "refm", refm))
                `uvm_fatal(this.get_full_name(), "No refm from high level")                  
            `uvm_info(this.get_full_name(), "get reference model by uvm_config_db", UVM_MEDIUM) 
                                                                                               
            file_wr_port_ciphertext_ciphertext = file_agent_pkg::file_write_agent#(64)::type_id::create("file_wr_port_ciphertext_ciphertext", this);
        endfunction                                                                            
                                                                                               
        function new (string name = "", uvm_component parent = null);                        
            super.new(name, parent);                                                           
            write_file_done_ciphertext_ciphertext = 0;                                                          
        endfunction                                                                            
                                                                                               
        virtual task run_phase(uvm_phase phase);                                               
            create_TVOUT_transaction_size_queue_by_depth(1);
            file_wr_port_ciphertext_ciphertext.config_file(   
                    `AUTOTB_TVOUT_ciphertext_ciphertext_wrapc,
                    TVOUT_transaction_size_queue                            
                );                                                          
                                                                            

            fork                                                                               
                                                                                               
                forever begin
                    @refm.dut2tb_ap_done;
                    `uvm_info(this.get_full_name(), "receive dut2tb_ap_done and do axim dump", UVM_LOW)
            if (ciphertext_apvld_rxtr) file_wr_port_ciphertext_ciphertext.write_TVOUT_data(ciphertext_apvld_rxtr.data[63: 0]);
                    file_wr_port_ciphertext_ciphertext.receive_ap_done();
             ciphertext_apvld_rxtr = null;
                end                                                                            
                begin                                                                          
                    @refm.finish;                                                              
                    `uvm_info(this.get_full_name(), "receive FINISH", UVM_LOW)               
                    file_wr_port_ciphertext_ciphertext.wait_write_file_done();
                end                                                                            
                begin                                                                      
                    forever begin                                                              
                        wait(write_section_done_ciphertext_ciphertext);                          
                        write_section_done_ciphertext_ciphertext = 0;                                               
                        -> refm.allsvr_output_done;                                         
                    end                                                                        
                end                                                                        
            join                                                                               
        endtask                                                                                
                                                                                               
        virtual function void create_TVOUT_transaction_size_queue_by_depth(integer depth); 
            integer i;                                                                     
            TVOUT_transaction_size_queue.delete();                                         
            for (i = 0; i < 5; i++)                                    
                TVOUT_transaction_size_queue.push_back(depth);                             
        endfunction                                                                        
                                                                                           
        virtual function void write_svr_master_plaintext(svr_transfer#(64) tr);
            `uvm_info(this.get_full_name(), "port plaintext collected one pkt", UVM_DEBUG);          
        endfunction
                   
        virtual function void write_svr_master_key(svr_transfer#(64) tr);
            `uvm_info(this.get_full_name(), "port key collected one pkt", UVM_DEBUG);          
        endfunction
                   
        virtual function void write_svr_slave_ciphertext(svr_transfer#(64) tr);
            `uvm_info(this.get_full_name(), "port ciphertext collected one pkt", UVM_DEBUG);          
             ciphertext_apvld_rxtr = tr;
            write_section_done_ciphertext_ciphertext = 1;
        endfunction
                   
    endclass                                                                                   
                                                                                               
`endif                                                                                         

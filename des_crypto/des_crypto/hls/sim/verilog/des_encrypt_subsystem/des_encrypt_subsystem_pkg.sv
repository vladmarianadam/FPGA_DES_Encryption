//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================
`timescale 1ns/1ps 

`ifndef DES_ENCRYPT_SUBSYSTEM_PKG__SV          
    `define DES_ENCRYPT_SUBSYSTEM_PKG__SV      
                                                     
    package des_encrypt_subsystem_pkg;               
                                                     
        import uvm_pkg::*;                           
        import file_agent_pkg::*;                    
        import svr_pkg::*;
                                                     
        `include "uvm_macros.svh"                  
                                                     
        `include "des_encrypt_config.sv"           
        `include "des_encrypt_reference_model.sv"  
        `include "des_encrypt_scoreboard.sv"       
        `include "des_encrypt_subsystem_monitor.sv"
        `include "des_encrypt_virtual_sequencer.sv"
        `include "des_encrypt_pkg_sequence_lib.sv" 
        `include "des_encrypt_env.sv"              
                                                     
    endpackage                                       
                                                     
`endif                                               

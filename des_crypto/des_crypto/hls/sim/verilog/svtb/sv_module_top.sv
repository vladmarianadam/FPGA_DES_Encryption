//==============================================================
//Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
//Tool Version Limit: 2025.11
//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
//
//==============================================================

`ifndef SV_MODULE_TOP_SV
`define SV_MODULE_TOP_SV


`timescale 1ns/1ps


`include "uvm_macros.svh"
import uvm_pkg::*;
import file_agent_pkg::*;
import svr_pkg::*;
import des_encrypt_subsystem_pkg::*;
`include "des_encrypt_subsys_test_sequence_lib.sv"
`include "des_encrypt_test_lib.sv"


module sv_module_top;


    misc_interface              misc_if ( .clock(apatb_des_encrypt_top.AESL_clock), .reset(apatb_des_encrypt_top.AESL_reset) );
    assign apatb_des_encrypt_top.ap_start = misc_if.tb2dut_ap_start;
    assign misc_if.dut2tb_ap_done = apatb_des_encrypt_top.ap_done;
    assign misc_if.dut2tb_ap_ready = apatb_des_encrypt_top.ap_ready;
    initial begin
        uvm_config_db #(virtual misc_interface)::set(null, "uvm_test_top.top_env.*", "misc_if", misc_if);
    end


    svr_if #(64)  svr_plaintext_if    (.clk  (apatb_des_encrypt_top.AESL_clock), .rst(apatb_des_encrypt_top.AESL_reset));
    assign apatb_des_encrypt_top.plaintext = svr_plaintext_if.data[63:0];
    assign svr_plaintext_if.ready = svr_plaintext_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(64) )::set(null, "uvm_test_top.top_env.env_master_svr_plaintext.*", "vif", svr_plaintext_if);
    end


    svr_if #(64)  svr_key_if    (.clk  (apatb_des_encrypt_top.AESL_clock), .rst(apatb_des_encrypt_top.AESL_reset));
    assign apatb_des_encrypt_top.key = svr_key_if.data[63:0];
    assign svr_key_if.ready = svr_key_if.valid & misc_if.tb2dut_ap_start;
    initial begin
        uvm_config_db #( virtual svr_if#(64) )::set(null, "uvm_test_top.top_env.env_master_svr_key.*", "vif", svr_key_if);
    end


    svr_if #(64)  svr_ciphertext_if    (.clk  (apatb_des_encrypt_top.AESL_clock), .rst(apatb_des_encrypt_top.AESL_reset));
    assign svr_ciphertext_if.valid = apatb_des_encrypt_top.ciphertext_ap_vld;
    assign svr_ciphertext_if.data[63:0] = apatb_des_encrypt_top.ciphertext;
    initial begin
        uvm_config_db #( virtual svr_if#(64) )::set(null, "uvm_test_top.top_env.env_slave_svr_ciphertext.*", "vif", svr_ciphertext_if);
    end


    initial begin
        run_test();
    end
endmodule
`endif

set moduleName des_encrypt
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set isPipelined_legacy 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set restart_counter_num 0
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set svuvm_can_support 1
set cdfgNum 4
set C_modelName {des_encrypt}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ plaintext int 64 regular  }
	{ key int 64 regular  }
	{ ciphertext int 64 regular {pointer 1}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "plaintext", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "key", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "ciphertext", "interface" : "wire", "bitwidth" : 64, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 10
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ plaintext sc_in sc_lv 64 signal 0 } 
	{ key sc_in sc_lv 64 signal 1 } 
	{ ciphertext sc_out sc_lv 64 signal 2 } 
	{ ciphertext_ap_vld sc_out sc_logic 1 outvld 2 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "plaintext", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "plaintext", "role": "default" }} , 
 	{ "name": "key", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "key", "role": "default" }} , 
 	{ "name": "ciphertext", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "ciphertext", "role": "default" }} , 
 	{ "name": "ciphertext_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ciphertext", "role": "ap_vld" }}  ]}

set ArgLastReadFirstWriteLatency {
	des_encrypt {
		plaintext {Type I LastRead 0 FirstWrite -1}
		key {Type I LastRead 0 FirstWrite -1}
		ciphertext {Type O LastRead -1 FirstWrite 1}}
	generate_subkeys {
		key {Type I LastRead 0 FirstWrite -1}}
	des_core {
		input_r {Type I LastRead 0 FirstWrite -1}
		subkeys_0_val {Type I LastRead 0 FirstWrite -1}
		subkeys_1_val {Type I LastRead 1 FirstWrite -1}
		subkeys_2_val {Type I LastRead 2 FirstWrite -1}
		subkeys_3_val {Type I LastRead 3 FirstWrite -1}
		subkeys_4_val {Type I LastRead 4 FirstWrite -1}
		subkeys_5_val {Type I LastRead 5 FirstWrite -1}
		subkeys_6_val {Type I LastRead 6 FirstWrite -1}
		subkeys_7_val {Type I LastRead 7 FirstWrite -1}
		subkeys_8_val {Type I LastRead 8 FirstWrite -1}
		subkeys_9_val {Type I LastRead 9 FirstWrite -1}
		subkeys_10_val {Type I LastRead 10 FirstWrite -1}
		subkeys_11_val {Type I LastRead 11 FirstWrite -1}
		subkeys_12_val {Type I LastRead 12 FirstWrite -1}
		subkeys_13_val {Type I LastRead 13 FirstWrite -1}
		subkeys_14_val {Type I LastRead 14 FirstWrite -1}
		subkeys_15_val {Type I LastRead 15 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "16", "Max" : "16"}
	, {"Name" : "Interval", "Min" : "17", "Max" : "17"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	plaintext { ap_none {  { plaintext in_data 0 64 } } }
	key { ap_none {  { key in_data 0 64 } } }
	ciphertext { ap_vld {  { ciphertext out_data 1 64 }  { ciphertext_ap_vld out_vld 1 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}

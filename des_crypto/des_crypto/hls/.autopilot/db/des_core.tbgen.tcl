set moduleName des_core
set isTopModule 0
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
set C_modelName {des_core}
set C_modelType { int 64 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ input_r int 64 regular  }
	{ subkeys_0_val int 48 regular  }
	{ subkeys_1_val int 48 regular  }
	{ subkeys_2_val int 48 regular  }
	{ subkeys_3_val int 48 regular  }
	{ subkeys_4_val int 48 regular  }
	{ subkeys_5_val int 48 regular  }
	{ subkeys_6_val int 48 regular  }
	{ subkeys_7_val int 48 regular  }
	{ subkeys_8_val int 48 regular  }
	{ subkeys_9_val int 48 regular  }
	{ subkeys_10_val int 48 regular  }
	{ subkeys_11_val int 48 regular  }
	{ subkeys_12_val int 48 regular  }
	{ subkeys_13_val int 48 regular  }
	{ subkeys_14_val int 48 regular  }
	{ subkeys_15_val int 48 regular  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "input_r", "interface" : "wire", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_0_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_1_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_2_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_3_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_4_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_5_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_6_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_7_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_8_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_9_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_10_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_11_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_12_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_13_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_14_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "subkeys_15_val", "interface" : "wire", "bitwidth" : 48, "direction" : "READONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 64} ]}
# RTL Port declarations: 
set portNum 24
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ input_r sc_in sc_lv 64 signal 0 } 
	{ subkeys_0_val sc_in sc_lv 48 signal 1 } 
	{ subkeys_1_val sc_in sc_lv 48 signal 2 } 
	{ subkeys_2_val sc_in sc_lv 48 signal 3 } 
	{ subkeys_3_val sc_in sc_lv 48 signal 4 } 
	{ subkeys_4_val sc_in sc_lv 48 signal 5 } 
	{ subkeys_5_val sc_in sc_lv 48 signal 6 } 
	{ subkeys_6_val sc_in sc_lv 48 signal 7 } 
	{ subkeys_7_val sc_in sc_lv 48 signal 8 } 
	{ subkeys_8_val sc_in sc_lv 48 signal 9 } 
	{ subkeys_9_val sc_in sc_lv 48 signal 10 } 
	{ subkeys_10_val sc_in sc_lv 48 signal 11 } 
	{ subkeys_11_val sc_in sc_lv 48 signal 12 } 
	{ subkeys_12_val sc_in sc_lv 48 signal 13 } 
	{ subkeys_13_val sc_in sc_lv 48 signal 14 } 
	{ subkeys_14_val sc_in sc_lv 48 signal 15 } 
	{ subkeys_15_val sc_in sc_lv 48 signal 16 } 
	{ ap_return sc_out sc_lv 64 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "input_r", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "input_r", "role": "default" }} , 
 	{ "name": "subkeys_0_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_0_val", "role": "default" }} , 
 	{ "name": "subkeys_1_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_1_val", "role": "default" }} , 
 	{ "name": "subkeys_2_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_2_val", "role": "default" }} , 
 	{ "name": "subkeys_3_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_3_val", "role": "default" }} , 
 	{ "name": "subkeys_4_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_4_val", "role": "default" }} , 
 	{ "name": "subkeys_5_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_5_val", "role": "default" }} , 
 	{ "name": "subkeys_6_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_6_val", "role": "default" }} , 
 	{ "name": "subkeys_7_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_7_val", "role": "default" }} , 
 	{ "name": "subkeys_8_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_8_val", "role": "default" }} , 
 	{ "name": "subkeys_9_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_9_val", "role": "default" }} , 
 	{ "name": "subkeys_10_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_10_val", "role": "default" }} , 
 	{ "name": "subkeys_11_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_11_val", "role": "default" }} , 
 	{ "name": "subkeys_12_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_12_val", "role": "default" }} , 
 	{ "name": "subkeys_13_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_13_val", "role": "default" }} , 
 	{ "name": "subkeys_14_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_14_val", "role": "default" }} , 
 	{ "name": "subkeys_15_val", "direction": "in", "datatype": "sc_lv", "bitwidth":48, "type": "signal", "bundle":{"name": "subkeys_15_val", "role": "default" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "15", "Max" : "15"}
	, {"Name" : "Interval", "Min" : "15", "Max" : "15"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_r { ap_none {  { input_r in_data 0 64 } } }
	subkeys_0_val { ap_none {  { subkeys_0_val in_data 0 48 } } }
	subkeys_1_val { ap_none {  { subkeys_1_val in_data 0 48 } } }
	subkeys_2_val { ap_none {  { subkeys_2_val in_data 0 48 } } }
	subkeys_3_val { ap_none {  { subkeys_3_val in_data 0 48 } } }
	subkeys_4_val { ap_none {  { subkeys_4_val in_data 0 48 } } }
	subkeys_5_val { ap_none {  { subkeys_5_val in_data 0 48 } } }
	subkeys_6_val { ap_none {  { subkeys_6_val in_data 0 48 } } }
	subkeys_7_val { ap_none {  { subkeys_7_val in_data 0 48 } } }
	subkeys_8_val { ap_none {  { subkeys_8_val in_data 0 48 } } }
	subkeys_9_val { ap_none {  { subkeys_9_val in_data 0 48 } } }
	subkeys_10_val { ap_none {  { subkeys_10_val in_data 0 48 } } }
	subkeys_11_val { ap_none {  { subkeys_11_val in_data 0 48 } } }
	subkeys_12_val { ap_none {  { subkeys_12_val in_data 0 48 } } }
	subkeys_13_val { ap_none {  { subkeys_13_val in_data 0 48 } } }
	subkeys_14_val { ap_none {  { subkeys_14_val in_data 0 48 } } }
	subkeys_15_val { ap_none {  { subkeys_15_val in_data 0 48 } } }
}

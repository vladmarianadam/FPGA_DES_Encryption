set moduleName chacha20_kernel
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
set cdfgNum 2
set C_modelName {chacha20_kernel}
set C_modelType { void 0 }
set ap_memory_interface_dict [dict create]
set C_modelArgList {
	{ state_0 int 32 regular {axi_slave 2}  }
	{ state_1 int 32 regular {axi_slave 2}  }
	{ state_2 int 32 regular {axi_slave 2}  }
	{ state_3 int 32 regular {axi_slave 2}  }
	{ state_4 int 32 regular {axi_slave 2}  }
	{ state_5 int 32 regular {axi_slave 2}  }
	{ state_6 int 32 regular {axi_slave 2}  }
	{ state_7 int 32 regular {axi_slave 2}  }
	{ state_8 int 32 regular {axi_slave 2}  }
	{ state_9 int 32 regular {axi_slave 2}  }
	{ state_10 int 32 regular {axi_slave 2}  }
	{ state_11 int 32 regular {axi_slave 2}  }
	{ state_12 int 32 regular {axi_slave 2}  }
	{ state_13 int 32 regular {axi_slave 2}  }
	{ state_14 int 32 regular {axi_slave 2}  }
	{ state_15 int 32 regular {axi_slave 2}  }
}
set hasAXIMCache 0
set l_AXIML2Cache [list]
set AXIMCacheInstDict [dict create]
set C_modelArgMapList {[ 
	{ "Name" : "state_0", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":16, "out":24}, "offset_end" : {"in":23, "out":31}} , 
 	{ "Name" : "state_1", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":32, "out":40}, "offset_end" : {"in":39, "out":47}} , 
 	{ "Name" : "state_2", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":48, "out":56}, "offset_end" : {"in":55, "out":63}} , 
 	{ "Name" : "state_3", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":64, "out":72}, "offset_end" : {"in":71, "out":79}} , 
 	{ "Name" : "state_4", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":80, "out":88}, "offset_end" : {"in":87, "out":95}} , 
 	{ "Name" : "state_5", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":96, "out":104}, "offset_end" : {"in":103, "out":111}} , 
 	{ "Name" : "state_6", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":112, "out":120}, "offset_end" : {"in":119, "out":127}} , 
 	{ "Name" : "state_7", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":128, "out":136}, "offset_end" : {"in":135, "out":143}} , 
 	{ "Name" : "state_8", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":144, "out":152}, "offset_end" : {"in":151, "out":159}} , 
 	{ "Name" : "state_9", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":160, "out":168}, "offset_end" : {"in":167, "out":175}} , 
 	{ "Name" : "state_10", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":176, "out":184}, "offset_end" : {"in":183, "out":191}} , 
 	{ "Name" : "state_11", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":192, "out":200}, "offset_end" : {"in":199, "out":207}} , 
 	{ "Name" : "state_12", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":208, "out":216}, "offset_end" : {"in":215, "out":223}} , 
 	{ "Name" : "state_13", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":224, "out":232}, "offset_end" : {"in":231, "out":239}} , 
 	{ "Name" : "state_14", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":240, "out":248}, "offset_end" : {"in":247, "out":255}} , 
 	{ "Name" : "state_15", "interface" : "axi_slave", "bundle":"control","type":"ap_ovld","bitwidth" : 32, "direction" : "READWRITE", "offset" : {"in":256, "out":264}, "offset_end" : {"in":263, "out":271}} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 9 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"chacha20_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"chacha20_kernel","role":"continue","value":"0","valid_bit":"4"},{"name":"chacha20_kernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"state_0","role":"data","value":"16"},{"name":"state_1","role":"data","value":"32"},{"name":"state_2","role":"data","value":"48"},{"name":"state_3","role":"data","value":"64"},{"name":"state_4","role":"data","value":"80"},{"name":"state_5","role":"data","value":"96"},{"name":"state_6","role":"data","value":"112"},{"name":"state_7","role":"data","value":"128"},{"name":"state_8","role":"data","value":"144"},{"name":"state_9","role":"data","value":"160"},{"name":"state_10","role":"data","value":"176"},{"name":"state_11","role":"data","value":"192"},{"name":"state_12","role":"data","value":"208"},{"name":"state_13","role":"data","value":"224"},{"name":"state_14","role":"data","value":"240"},{"name":"state_15","role":"data","value":"256"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"chacha20_kernel","role":"start","value":"0","valid_bit":"0"},{"name":"chacha20_kernel","role":"done","value":"0","valid_bit":"1"},{"name":"chacha20_kernel","role":"idle","value":"0","valid_bit":"2"},{"name":"chacha20_kernel","role":"ready","value":"0","valid_bit":"3"},{"name":"chacha20_kernel","role":"auto_start","value":"0","valid_bit":"7"},{"name":"state_0","role":"data","value":"24"}, {"name":"state_0","role":"valid","value":"28","valid_bit":"0"},{"name":"state_1","role":"data","value":"40"}, {"name":"state_1","role":"valid","value":"44","valid_bit":"0"},{"name":"state_2","role":"data","value":"56"}, {"name":"state_2","role":"valid","value":"60","valid_bit":"0"},{"name":"state_3","role":"data","value":"72"}, {"name":"state_3","role":"valid","value":"76","valid_bit":"0"},{"name":"state_4","role":"data","value":"88"}, {"name":"state_4","role":"valid","value":"92","valid_bit":"0"},{"name":"state_5","role":"data","value":"104"}, {"name":"state_5","role":"valid","value":"108","valid_bit":"0"},{"name":"state_6","role":"data","value":"120"}, {"name":"state_6","role":"valid","value":"124","valid_bit":"0"},{"name":"state_7","role":"data","value":"136"}, {"name":"state_7","role":"valid","value":"140","valid_bit":"0"},{"name":"state_8","role":"data","value":"152"}, {"name":"state_8","role":"valid","value":"156","valid_bit":"0"},{"name":"state_9","role":"data","value":"168"}, {"name":"state_9","role":"valid","value":"172","valid_bit":"0"},{"name":"state_10","role":"data","value":"184"}, {"name":"state_10","role":"valid","value":"188","valid_bit":"0"},{"name":"state_11","role":"data","value":"200"}, {"name":"state_11","role":"valid","value":"204","valid_bit":"0"},{"name":"state_12","role":"data","value":"216"}, {"name":"state_12","role":"valid","value":"220","valid_bit":"0"},{"name":"state_13","role":"data","value":"232"}, {"name":"state_13","role":"valid","value":"236","valid_bit":"0"},{"name":"state_14","role":"data","value":"248"}, {"name":"state_14","role":"valid","value":"252","valid_bit":"0"},{"name":"state_15","role":"data","value":"264"}, {"name":"state_15","role":"valid","value":"268","valid_bit":"0"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }}  ]}

set ArgLastReadFirstWriteLatency {
	chacha20_kernel {
		state_0 {Type IO LastRead 0 FirstWrite 53}
		state_1 {Type IO LastRead 0 FirstWrite 53}
		state_2 {Type IO LastRead 0 FirstWrite 53}
		state_3 {Type IO LastRead 0 FirstWrite 53}
		state_4 {Type IO LastRead 0 FirstWrite 53}
		state_5 {Type IO LastRead 0 FirstWrite 53}
		state_6 {Type IO LastRead 0 FirstWrite 53}
		state_7 {Type IO LastRead 0 FirstWrite 53}
		state_8 {Type IO LastRead 0 FirstWrite 53}
		state_9 {Type IO LastRead 0 FirstWrite 53}
		state_10 {Type IO LastRead 0 FirstWrite 53}
		state_11 {Type IO LastRead 0 FirstWrite 53}
		state_12 {Type IO LastRead 0 FirstWrite 53}
		state_13 {Type IO LastRead 0 FirstWrite 53}
		state_14 {Type IO LastRead 0 FirstWrite 53}
		state_15 {Type IO LastRead 0 FirstWrite 53}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "53", "Max" : "53"}
	, {"Name" : "Interval", "Min" : "54", "Max" : "54"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
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

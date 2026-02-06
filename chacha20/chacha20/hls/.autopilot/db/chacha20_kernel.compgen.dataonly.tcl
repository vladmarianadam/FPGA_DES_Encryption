# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
state_0_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 16
	offset_end 23
}
state_0_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 24
	offset_end 31
}
state_1_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 32
	offset_end 39
}
state_1_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 40
	offset_end 47
}
state_2_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 48
	offset_end 55
}
state_2_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 56
	offset_end 63
}
state_3_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 64
	offset_end 71
}
state_3_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 72
	offset_end 79
}
state_4_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 80
	offset_end 87
}
state_4_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 88
	offset_end 95
}
state_5_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 96
	offset_end 103
}
state_5_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 104
	offset_end 111
}
state_6_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 112
	offset_end 119
}
state_6_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 120
	offset_end 127
}
state_7_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 128
	offset_end 135
}
state_7_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 136
	offset_end 143
}
state_8_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 144
	offset_end 151
}
state_8_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 152
	offset_end 159
}
state_9_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 160
	offset_end 167
}
state_9_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 168
	offset_end 175
}
state_10_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 176
	offset_end 183
}
state_10_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 184
	offset_end 191
}
state_11_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 192
	offset_end 199
}
state_11_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 200
	offset_end 207
}
state_12_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 208
	offset_end 215
}
state_12_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 216
	offset_end 223
}
state_13_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 224
	offset_end 231
}
state_13_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 232
	offset_end 239
}
state_14_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 240
	offset_end 247
}
state_14_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 248
	offset_end 255
}
state_15_i { 
	dir I
	width 32
	depth 1
	mode ap_none
	offset 256
	offset_end 263
}
state_15_o { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 264
	offset_end 271
}
ap_start { }
ap_done { }
ap_ready { }
ap_idle { }
interrupt {
}
}
dict set axilite_register_dict control $port_control



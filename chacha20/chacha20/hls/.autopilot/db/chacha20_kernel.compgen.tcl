# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

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


# Native S_AXILite:
if {${::AESL::PGuard_simmodel_gen}} {
	if {[info proc ::AESL_LIB_XILADAPTER::s_axilite_gen] == "::AESL_LIB_XILADAPTER::s_axilite_gen"} {
		eval "::AESL_LIB_XILADAPTER::s_axilite_gen { \
			id 1 \
			corename chacha20_kernel_control_axilite \
			name chacha20_kernel_control_s_axi \
			ports {$port_control} \
			op interface \
			interrupt_clear_mode TOW \
			interrupt_trigger_type default \
			is_flushable 0 \
			is_datawidth64 0 \
			is_addrwidth64 1 \
			enable_mem_auto_widen 1 \
		} "
	} else {
		puts "@W \[IMPL-110\] Cannot find AXI Lite interface model in the library. Ignored generation of AXI Lite  interface for 'control'"
	}
}

if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler chacha20_kernel_control_s_axi BINDTYPE interface TYPE interface_s_axilite
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -1 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst_n
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -2 \
    name ${PortName} \
    reset_level 0 \
    sync_rst true \
    corename apif_ap_rst_n \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}



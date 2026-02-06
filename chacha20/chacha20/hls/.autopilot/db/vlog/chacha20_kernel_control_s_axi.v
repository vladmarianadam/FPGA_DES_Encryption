// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
(* DowngradeIPIdentifiedWarnings="yes" *) module chacha20_kernel_control_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 9,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [31:0]                   state_0_i,
    input  wire [31:0]                   state_0_o,
    input  wire                          state_0_o_ap_vld,
    output wire [31:0]                   state_1_i,
    input  wire [31:0]                   state_1_o,
    input  wire                          state_1_o_ap_vld,
    output wire [31:0]                   state_2_i,
    input  wire [31:0]                   state_2_o,
    input  wire                          state_2_o_ap_vld,
    output wire [31:0]                   state_3_i,
    input  wire [31:0]                   state_3_o,
    input  wire                          state_3_o_ap_vld,
    output wire [31:0]                   state_4_i,
    input  wire [31:0]                   state_4_o,
    input  wire                          state_4_o_ap_vld,
    output wire [31:0]                   state_5_i,
    input  wire [31:0]                   state_5_o,
    input  wire                          state_5_o_ap_vld,
    output wire [31:0]                   state_6_i,
    input  wire [31:0]                   state_6_o,
    input  wire                          state_6_o_ap_vld,
    output wire [31:0]                   state_7_i,
    input  wire [31:0]                   state_7_o,
    input  wire                          state_7_o_ap_vld,
    output wire [31:0]                   state_8_i,
    input  wire [31:0]                   state_8_o,
    input  wire                          state_8_o_ap_vld,
    output wire [31:0]                   state_9_i,
    input  wire [31:0]                   state_9_o,
    input  wire                          state_9_o_ap_vld,
    output wire [31:0]                   state_10_i,
    input  wire [31:0]                   state_10_o,
    input  wire                          state_10_o_ap_vld,
    output wire [31:0]                   state_11_i,
    input  wire [31:0]                   state_11_o,
    input  wire                          state_11_o_ap_vld,
    output wire [31:0]                   state_12_i,
    input  wire [31:0]                   state_12_o,
    input  wire                          state_12_o_ap_vld,
    output wire [31:0]                   state_13_i,
    input  wire [31:0]                   state_13_o,
    input  wire                          state_13_o_ap_vld,
    output wire [31:0]                   state_14_i,
    input  wire [31:0]                   state_14_o,
    input  wire                          state_14_o_ap_vld,
    output wire [31:0]                   state_15_i,
    input  wire [31:0]                   state_15_o,
    input  wire                          state_15_o_ap_vld,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// Protocol Used: ap_ctrl_hs
//
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         bit 9  - interrupt (Read)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0 - enable ap_done interrupt (Read/Write)
//         bit 1 - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0 - ap_done (Read/TOW)
//         bit 1 - ap_ready (Read/TOW)
//         others - reserved
// 0x010 : Data signal of state_0_i
//         bit 31~0 - state_0_i[31:0] (Read/Write)
// 0x014 : reserved
// 0x018 : Data signal of state_0_o
//         bit 31~0 - state_0_o[31:0] (Read)
// 0x01c : Control signal of state_0_o
//         bit 0  - state_0_o_ap_vld (Read/COR)
//         others - reserved
// 0x020 : Data signal of state_1_i
//         bit 31~0 - state_1_i[31:0] (Read/Write)
// 0x024 : reserved
// 0x028 : Data signal of state_1_o
//         bit 31~0 - state_1_o[31:0] (Read)
// 0x02c : Control signal of state_1_o
//         bit 0  - state_1_o_ap_vld (Read/COR)
//         others - reserved
// 0x030 : Data signal of state_2_i
//         bit 31~0 - state_2_i[31:0] (Read/Write)
// 0x034 : reserved
// 0x038 : Data signal of state_2_o
//         bit 31~0 - state_2_o[31:0] (Read)
// 0x03c : Control signal of state_2_o
//         bit 0  - state_2_o_ap_vld (Read/COR)
//         others - reserved
// 0x040 : Data signal of state_3_i
//         bit 31~0 - state_3_i[31:0] (Read/Write)
// 0x044 : reserved
// 0x048 : Data signal of state_3_o
//         bit 31~0 - state_3_o[31:0] (Read)
// 0x04c : Control signal of state_3_o
//         bit 0  - state_3_o_ap_vld (Read/COR)
//         others - reserved
// 0x050 : Data signal of state_4_i
//         bit 31~0 - state_4_i[31:0] (Read/Write)
// 0x054 : reserved
// 0x058 : Data signal of state_4_o
//         bit 31~0 - state_4_o[31:0] (Read)
// 0x05c : Control signal of state_4_o
//         bit 0  - state_4_o_ap_vld (Read/COR)
//         others - reserved
// 0x060 : Data signal of state_5_i
//         bit 31~0 - state_5_i[31:0] (Read/Write)
// 0x064 : reserved
// 0x068 : Data signal of state_5_o
//         bit 31~0 - state_5_o[31:0] (Read)
// 0x06c : Control signal of state_5_o
//         bit 0  - state_5_o_ap_vld (Read/COR)
//         others - reserved
// 0x070 : Data signal of state_6_i
//         bit 31~0 - state_6_i[31:0] (Read/Write)
// 0x074 : reserved
// 0x078 : Data signal of state_6_o
//         bit 31~0 - state_6_o[31:0] (Read)
// 0x07c : Control signal of state_6_o
//         bit 0  - state_6_o_ap_vld (Read/COR)
//         others - reserved
// 0x080 : Data signal of state_7_i
//         bit 31~0 - state_7_i[31:0] (Read/Write)
// 0x084 : reserved
// 0x088 : Data signal of state_7_o
//         bit 31~0 - state_7_o[31:0] (Read)
// 0x08c : Control signal of state_7_o
//         bit 0  - state_7_o_ap_vld (Read/COR)
//         others - reserved
// 0x090 : Data signal of state_8_i
//         bit 31~0 - state_8_i[31:0] (Read/Write)
// 0x094 : reserved
// 0x098 : Data signal of state_8_o
//         bit 31~0 - state_8_o[31:0] (Read)
// 0x09c : Control signal of state_8_o
//         bit 0  - state_8_o_ap_vld (Read/COR)
//         others - reserved
// 0x0a0 : Data signal of state_9_i
//         bit 31~0 - state_9_i[31:0] (Read/Write)
// 0x0a4 : reserved
// 0x0a8 : Data signal of state_9_o
//         bit 31~0 - state_9_o[31:0] (Read)
// 0x0ac : Control signal of state_9_o
//         bit 0  - state_9_o_ap_vld (Read/COR)
//         others - reserved
// 0x0b0 : Data signal of state_10_i
//         bit 31~0 - state_10_i[31:0] (Read/Write)
// 0x0b4 : reserved
// 0x0b8 : Data signal of state_10_o
//         bit 31~0 - state_10_o[31:0] (Read)
// 0x0bc : Control signal of state_10_o
//         bit 0  - state_10_o_ap_vld (Read/COR)
//         others - reserved
// 0x0c0 : Data signal of state_11_i
//         bit 31~0 - state_11_i[31:0] (Read/Write)
// 0x0c4 : reserved
// 0x0c8 : Data signal of state_11_o
//         bit 31~0 - state_11_o[31:0] (Read)
// 0x0cc : Control signal of state_11_o
//         bit 0  - state_11_o_ap_vld (Read/COR)
//         others - reserved
// 0x0d0 : Data signal of state_12_i
//         bit 31~0 - state_12_i[31:0] (Read/Write)
// 0x0d4 : reserved
// 0x0d8 : Data signal of state_12_o
//         bit 31~0 - state_12_o[31:0] (Read)
// 0x0dc : Control signal of state_12_o
//         bit 0  - state_12_o_ap_vld (Read/COR)
//         others - reserved
// 0x0e0 : Data signal of state_13_i
//         bit 31~0 - state_13_i[31:0] (Read/Write)
// 0x0e4 : reserved
// 0x0e8 : Data signal of state_13_o
//         bit 31~0 - state_13_o[31:0] (Read)
// 0x0ec : Control signal of state_13_o
//         bit 0  - state_13_o_ap_vld (Read/COR)
//         others - reserved
// 0x0f0 : Data signal of state_14_i
//         bit 31~0 - state_14_i[31:0] (Read/Write)
// 0x0f4 : reserved
// 0x0f8 : Data signal of state_14_o
//         bit 31~0 - state_14_o[31:0] (Read)
// 0x0fc : Control signal of state_14_o
//         bit 0  - state_14_o_ap_vld (Read/COR)
//         others - reserved
// 0x100 : Data signal of state_15_i
//         bit 31~0 - state_15_i[31:0] (Read/Write)
// 0x104 : reserved
// 0x108 : Data signal of state_15_o
//         bit 31~0 - state_15_o[31:0] (Read)
// 0x10c : Control signal of state_15_o
//         bit 0  - state_15_o_ap_vld (Read/COR)
//         others - reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL           = 9'h000,
    ADDR_GIE               = 9'h004,
    ADDR_IER               = 9'h008,
    ADDR_ISR               = 9'h00c,
    ADDR_STATE_0_I_DATA_0  = 9'h010,
    ADDR_STATE_0_I_CTRL    = 9'h014,
    ADDR_STATE_0_O_DATA_0  = 9'h018,
    ADDR_STATE_0_O_CTRL    = 9'h01c,
    ADDR_STATE_1_I_DATA_0  = 9'h020,
    ADDR_STATE_1_I_CTRL    = 9'h024,
    ADDR_STATE_1_O_DATA_0  = 9'h028,
    ADDR_STATE_1_O_CTRL    = 9'h02c,
    ADDR_STATE_2_I_DATA_0  = 9'h030,
    ADDR_STATE_2_I_CTRL    = 9'h034,
    ADDR_STATE_2_O_DATA_0  = 9'h038,
    ADDR_STATE_2_O_CTRL    = 9'h03c,
    ADDR_STATE_3_I_DATA_0  = 9'h040,
    ADDR_STATE_3_I_CTRL    = 9'h044,
    ADDR_STATE_3_O_DATA_0  = 9'h048,
    ADDR_STATE_3_O_CTRL    = 9'h04c,
    ADDR_STATE_4_I_DATA_0  = 9'h050,
    ADDR_STATE_4_I_CTRL    = 9'h054,
    ADDR_STATE_4_O_DATA_0  = 9'h058,
    ADDR_STATE_4_O_CTRL    = 9'h05c,
    ADDR_STATE_5_I_DATA_0  = 9'h060,
    ADDR_STATE_5_I_CTRL    = 9'h064,
    ADDR_STATE_5_O_DATA_0  = 9'h068,
    ADDR_STATE_5_O_CTRL    = 9'h06c,
    ADDR_STATE_6_I_DATA_0  = 9'h070,
    ADDR_STATE_6_I_CTRL    = 9'h074,
    ADDR_STATE_6_O_DATA_0  = 9'h078,
    ADDR_STATE_6_O_CTRL    = 9'h07c,
    ADDR_STATE_7_I_DATA_0  = 9'h080,
    ADDR_STATE_7_I_CTRL    = 9'h084,
    ADDR_STATE_7_O_DATA_0  = 9'h088,
    ADDR_STATE_7_O_CTRL    = 9'h08c,
    ADDR_STATE_8_I_DATA_0  = 9'h090,
    ADDR_STATE_8_I_CTRL    = 9'h094,
    ADDR_STATE_8_O_DATA_0  = 9'h098,
    ADDR_STATE_8_O_CTRL    = 9'h09c,
    ADDR_STATE_9_I_DATA_0  = 9'h0a0,
    ADDR_STATE_9_I_CTRL    = 9'h0a4,
    ADDR_STATE_9_O_DATA_0  = 9'h0a8,
    ADDR_STATE_9_O_CTRL    = 9'h0ac,
    ADDR_STATE_10_I_DATA_0 = 9'h0b0,
    ADDR_STATE_10_I_CTRL   = 9'h0b4,
    ADDR_STATE_10_O_DATA_0 = 9'h0b8,
    ADDR_STATE_10_O_CTRL   = 9'h0bc,
    ADDR_STATE_11_I_DATA_0 = 9'h0c0,
    ADDR_STATE_11_I_CTRL   = 9'h0c4,
    ADDR_STATE_11_O_DATA_0 = 9'h0c8,
    ADDR_STATE_11_O_CTRL   = 9'h0cc,
    ADDR_STATE_12_I_DATA_0 = 9'h0d0,
    ADDR_STATE_12_I_CTRL   = 9'h0d4,
    ADDR_STATE_12_O_DATA_0 = 9'h0d8,
    ADDR_STATE_12_O_CTRL   = 9'h0dc,
    ADDR_STATE_13_I_DATA_0 = 9'h0e0,
    ADDR_STATE_13_I_CTRL   = 9'h0e4,
    ADDR_STATE_13_O_DATA_0 = 9'h0e8,
    ADDR_STATE_13_O_CTRL   = 9'h0ec,
    ADDR_STATE_14_I_DATA_0 = 9'h0f0,
    ADDR_STATE_14_I_CTRL   = 9'h0f4,
    ADDR_STATE_14_O_DATA_0 = 9'h0f8,
    ADDR_STATE_14_O_CTRL   = 9'h0fc,
    ADDR_STATE_15_I_DATA_0 = 9'h100,
    ADDR_STATE_15_I_CTRL   = 9'h104,
    ADDR_STATE_15_O_DATA_0 = 9'h108,
    ADDR_STATE_15_O_CTRL   = 9'h10c,
    WRIDLE                 = 2'd0,
    WRDATA                 = 2'd1,
    WRRESP                 = 2'd2,
    WRRESET                = 2'd3,
    RDIDLE                 = 2'd0,
    RDDATA                 = 2'd1,
    RDRESET                = 2'd2,
    ADDR_BITS                = 9;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle = 1'b0;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_interrupt = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [31:0]                   int_state_0_i = 'b0;
    reg                           int_state_0_o_ap_vld;
    reg  [31:0]                   int_state_0_o = 'b0;
    reg  [31:0]                   int_state_1_i = 'b0;
    reg                           int_state_1_o_ap_vld;
    reg  [31:0]                   int_state_1_o = 'b0;
    reg  [31:0]                   int_state_2_i = 'b0;
    reg                           int_state_2_o_ap_vld;
    reg  [31:0]                   int_state_2_o = 'b0;
    reg  [31:0]                   int_state_3_i = 'b0;
    reg                           int_state_3_o_ap_vld;
    reg  [31:0]                   int_state_3_o = 'b0;
    reg  [31:0]                   int_state_4_i = 'b0;
    reg                           int_state_4_o_ap_vld;
    reg  [31:0]                   int_state_4_o = 'b0;
    reg  [31:0]                   int_state_5_i = 'b0;
    reg                           int_state_5_o_ap_vld;
    reg  [31:0]                   int_state_5_o = 'b0;
    reg  [31:0]                   int_state_6_i = 'b0;
    reg                           int_state_6_o_ap_vld;
    reg  [31:0]                   int_state_6_o = 'b0;
    reg  [31:0]                   int_state_7_i = 'b0;
    reg                           int_state_7_o_ap_vld;
    reg  [31:0]                   int_state_7_o = 'b0;
    reg  [31:0]                   int_state_8_i = 'b0;
    reg                           int_state_8_o_ap_vld;
    reg  [31:0]                   int_state_8_o = 'b0;
    reg  [31:0]                   int_state_9_i = 'b0;
    reg                           int_state_9_o_ap_vld;
    reg  [31:0]                   int_state_9_o = 'b0;
    reg  [31:0]                   int_state_10_i = 'b0;
    reg                           int_state_10_o_ap_vld;
    reg  [31:0]                   int_state_10_o = 'b0;
    reg  [31:0]                   int_state_11_i = 'b0;
    reg                           int_state_11_o_ap_vld;
    reg  [31:0]                   int_state_11_o = 'b0;
    reg  [31:0]                   int_state_12_i = 'b0;
    reg                           int_state_12_o_ap_vld;
    reg  [31:0]                   int_state_12_o = 'b0;
    reg  [31:0]                   int_state_13_i = 'b0;
    reg                           int_state_13_o_ap_vld;
    reg  [31:0]                   int_state_13_o = 'b0;
    reg  [31:0]                   int_state_14_i = 'b0;
    reg                           int_state_14_o_ap_vld;
    reg  [31:0]                   int_state_14_o = 'b0;
    reg  [31:0]                   int_state_15_i = 'b0;
    reg                           int_state_15_o_ap_vld;
    reg  [31:0]                   int_state_15_o = 'b0;

//------------------------Instantiation------------------


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BVALID  = (wstate == WRRESP);
assign BRESP   = 2'b00;  // OKAY
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY & BVALID)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= {AWADDR[ADDR_BITS-1:2], {2{1'b0}}};
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA);
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                    rdata[9] <= int_interrupt;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_STATE_0_I_DATA_0: begin
                    rdata <= int_state_0_i[31:0];
                end
                ADDR_STATE_0_O_DATA_0: begin
                    rdata <= int_state_0_o[31:0];
                end
                ADDR_STATE_0_O_CTRL: begin
                    rdata[0] <= int_state_0_o_ap_vld;
                end
                ADDR_STATE_1_I_DATA_0: begin
                    rdata <= int_state_1_i[31:0];
                end
                ADDR_STATE_1_O_DATA_0: begin
                    rdata <= int_state_1_o[31:0];
                end
                ADDR_STATE_1_O_CTRL: begin
                    rdata[0] <= int_state_1_o_ap_vld;
                end
                ADDR_STATE_2_I_DATA_0: begin
                    rdata <= int_state_2_i[31:0];
                end
                ADDR_STATE_2_O_DATA_0: begin
                    rdata <= int_state_2_o[31:0];
                end
                ADDR_STATE_2_O_CTRL: begin
                    rdata[0] <= int_state_2_o_ap_vld;
                end
                ADDR_STATE_3_I_DATA_0: begin
                    rdata <= int_state_3_i[31:0];
                end
                ADDR_STATE_3_O_DATA_0: begin
                    rdata <= int_state_3_o[31:0];
                end
                ADDR_STATE_3_O_CTRL: begin
                    rdata[0] <= int_state_3_o_ap_vld;
                end
                ADDR_STATE_4_I_DATA_0: begin
                    rdata <= int_state_4_i[31:0];
                end
                ADDR_STATE_4_O_DATA_0: begin
                    rdata <= int_state_4_o[31:0];
                end
                ADDR_STATE_4_O_CTRL: begin
                    rdata[0] <= int_state_4_o_ap_vld;
                end
                ADDR_STATE_5_I_DATA_0: begin
                    rdata <= int_state_5_i[31:0];
                end
                ADDR_STATE_5_O_DATA_0: begin
                    rdata <= int_state_5_o[31:0];
                end
                ADDR_STATE_5_O_CTRL: begin
                    rdata[0] <= int_state_5_o_ap_vld;
                end
                ADDR_STATE_6_I_DATA_0: begin
                    rdata <= int_state_6_i[31:0];
                end
                ADDR_STATE_6_O_DATA_0: begin
                    rdata <= int_state_6_o[31:0];
                end
                ADDR_STATE_6_O_CTRL: begin
                    rdata[0] <= int_state_6_o_ap_vld;
                end
                ADDR_STATE_7_I_DATA_0: begin
                    rdata <= int_state_7_i[31:0];
                end
                ADDR_STATE_7_O_DATA_0: begin
                    rdata <= int_state_7_o[31:0];
                end
                ADDR_STATE_7_O_CTRL: begin
                    rdata[0] <= int_state_7_o_ap_vld;
                end
                ADDR_STATE_8_I_DATA_0: begin
                    rdata <= int_state_8_i[31:0];
                end
                ADDR_STATE_8_O_DATA_0: begin
                    rdata <= int_state_8_o[31:0];
                end
                ADDR_STATE_8_O_CTRL: begin
                    rdata[0] <= int_state_8_o_ap_vld;
                end
                ADDR_STATE_9_I_DATA_0: begin
                    rdata <= int_state_9_i[31:0];
                end
                ADDR_STATE_9_O_DATA_0: begin
                    rdata <= int_state_9_o[31:0];
                end
                ADDR_STATE_9_O_CTRL: begin
                    rdata[0] <= int_state_9_o_ap_vld;
                end
                ADDR_STATE_10_I_DATA_0: begin
                    rdata <= int_state_10_i[31:0];
                end
                ADDR_STATE_10_O_DATA_0: begin
                    rdata <= int_state_10_o[31:0];
                end
                ADDR_STATE_10_O_CTRL: begin
                    rdata[0] <= int_state_10_o_ap_vld;
                end
                ADDR_STATE_11_I_DATA_0: begin
                    rdata <= int_state_11_i[31:0];
                end
                ADDR_STATE_11_O_DATA_0: begin
                    rdata <= int_state_11_o[31:0];
                end
                ADDR_STATE_11_O_CTRL: begin
                    rdata[0] <= int_state_11_o_ap_vld;
                end
                ADDR_STATE_12_I_DATA_0: begin
                    rdata <= int_state_12_i[31:0];
                end
                ADDR_STATE_12_O_DATA_0: begin
                    rdata <= int_state_12_o[31:0];
                end
                ADDR_STATE_12_O_CTRL: begin
                    rdata[0] <= int_state_12_o_ap_vld;
                end
                ADDR_STATE_13_I_DATA_0: begin
                    rdata <= int_state_13_i[31:0];
                end
                ADDR_STATE_13_O_DATA_0: begin
                    rdata <= int_state_13_o[31:0];
                end
                ADDR_STATE_13_O_CTRL: begin
                    rdata[0] <= int_state_13_o_ap_vld;
                end
                ADDR_STATE_14_I_DATA_0: begin
                    rdata <= int_state_14_i[31:0];
                end
                ADDR_STATE_14_O_DATA_0: begin
                    rdata <= int_state_14_o[31:0];
                end
                ADDR_STATE_14_O_CTRL: begin
                    rdata[0] <= int_state_14_o_ap_vld;
                end
                ADDR_STATE_15_I_DATA_0: begin
                    rdata <= int_state_15_i[31:0];
                end
                ADDR_STATE_15_O_DATA_0: begin
                    rdata <= int_state_15_o[31:0];
                end
                ADDR_STATE_15_O_CTRL: begin
                    rdata[0] <= int_state_15_o_ap_vld;
                end
            endcase
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_interrupt;
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign state_0_i         = int_state_0_i;
assign state_1_i         = int_state_1_i;
assign state_2_i         = int_state_2_i;
assign state_3_i         = int_state_3_i;
assign state_4_i         = int_state_4_i;
assign state_5_i         = int_state_5_i;
assign state_6_i         = int_state_6_i;
assign state_7_i         = int_state_7_i;
assign state_8_i         = int_state_8_i;
assign state_9_i         = int_state_9_i;
assign state_10_i        = int_state_10_i;
assign state_11_i        = int_state_11_i;
assign state_12_i        = int_state_12_i;
assign state_13_i        = int_state_13_i;
assign state_14_i        = int_state_14_i;
assign state_15_i        = int_state_15_i;
// int_interrupt
always @(posedge ACLK) begin
    if (ARESET)
        int_interrupt <= 1'b0;
    else if (ACLK_EN) begin
        if (int_gie && (|int_isr))
            int_interrupt <= 1'b1;
        else
            int_interrupt <= 1'b0;
    end
end

// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <= WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_state_0_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_0_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_0_I_DATA_0)
            int_state_0_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_0_i[31:0] & ~wmask);
    end
end

// int_state_0_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_0_o <= 0;
    else if (ACLK_EN) begin
        if (state_0_o_ap_vld)
            int_state_0_o <= state_0_o;
    end
end

// int_state_0_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_0_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_0_o_ap_vld)
            int_state_0_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_0_O_CTRL)
            int_state_0_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_1_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_1_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_1_I_DATA_0)
            int_state_1_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_1_i[31:0] & ~wmask);
    end
end

// int_state_1_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_1_o <= 0;
    else if (ACLK_EN) begin
        if (state_1_o_ap_vld)
            int_state_1_o <= state_1_o;
    end
end

// int_state_1_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_1_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_1_o_ap_vld)
            int_state_1_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_1_O_CTRL)
            int_state_1_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_2_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_2_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_2_I_DATA_0)
            int_state_2_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_2_i[31:0] & ~wmask);
    end
end

// int_state_2_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_2_o <= 0;
    else if (ACLK_EN) begin
        if (state_2_o_ap_vld)
            int_state_2_o <= state_2_o;
    end
end

// int_state_2_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_2_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_2_o_ap_vld)
            int_state_2_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_2_O_CTRL)
            int_state_2_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_3_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_3_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_3_I_DATA_0)
            int_state_3_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_3_i[31:0] & ~wmask);
    end
end

// int_state_3_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_3_o <= 0;
    else if (ACLK_EN) begin
        if (state_3_o_ap_vld)
            int_state_3_o <= state_3_o;
    end
end

// int_state_3_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_3_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_3_o_ap_vld)
            int_state_3_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_3_O_CTRL)
            int_state_3_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_4_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_4_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_4_I_DATA_0)
            int_state_4_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_4_i[31:0] & ~wmask);
    end
end

// int_state_4_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_4_o <= 0;
    else if (ACLK_EN) begin
        if (state_4_o_ap_vld)
            int_state_4_o <= state_4_o;
    end
end

// int_state_4_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_4_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_4_o_ap_vld)
            int_state_4_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_4_O_CTRL)
            int_state_4_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_5_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_5_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_5_I_DATA_0)
            int_state_5_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_5_i[31:0] & ~wmask);
    end
end

// int_state_5_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_5_o <= 0;
    else if (ACLK_EN) begin
        if (state_5_o_ap_vld)
            int_state_5_o <= state_5_o;
    end
end

// int_state_5_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_5_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_5_o_ap_vld)
            int_state_5_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_5_O_CTRL)
            int_state_5_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_6_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_6_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_6_I_DATA_0)
            int_state_6_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_6_i[31:0] & ~wmask);
    end
end

// int_state_6_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_6_o <= 0;
    else if (ACLK_EN) begin
        if (state_6_o_ap_vld)
            int_state_6_o <= state_6_o;
    end
end

// int_state_6_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_6_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_6_o_ap_vld)
            int_state_6_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_6_O_CTRL)
            int_state_6_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_7_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_7_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_7_I_DATA_0)
            int_state_7_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_7_i[31:0] & ~wmask);
    end
end

// int_state_7_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_7_o <= 0;
    else if (ACLK_EN) begin
        if (state_7_o_ap_vld)
            int_state_7_o <= state_7_o;
    end
end

// int_state_7_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_7_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_7_o_ap_vld)
            int_state_7_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_7_O_CTRL)
            int_state_7_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_8_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_8_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_8_I_DATA_0)
            int_state_8_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_8_i[31:0] & ~wmask);
    end
end

// int_state_8_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_8_o <= 0;
    else if (ACLK_EN) begin
        if (state_8_o_ap_vld)
            int_state_8_o <= state_8_o;
    end
end

// int_state_8_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_8_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_8_o_ap_vld)
            int_state_8_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_8_O_CTRL)
            int_state_8_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_9_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_9_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_9_I_DATA_0)
            int_state_9_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_9_i[31:0] & ~wmask);
    end
end

// int_state_9_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_9_o <= 0;
    else if (ACLK_EN) begin
        if (state_9_o_ap_vld)
            int_state_9_o <= state_9_o;
    end
end

// int_state_9_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_9_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_9_o_ap_vld)
            int_state_9_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_9_O_CTRL)
            int_state_9_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_10_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_10_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_10_I_DATA_0)
            int_state_10_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_10_i[31:0] & ~wmask);
    end
end

// int_state_10_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_10_o <= 0;
    else if (ACLK_EN) begin
        if (state_10_o_ap_vld)
            int_state_10_o <= state_10_o;
    end
end

// int_state_10_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_10_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_10_o_ap_vld)
            int_state_10_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_10_O_CTRL)
            int_state_10_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_11_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_11_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_11_I_DATA_0)
            int_state_11_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_11_i[31:0] & ~wmask);
    end
end

// int_state_11_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_11_o <= 0;
    else if (ACLK_EN) begin
        if (state_11_o_ap_vld)
            int_state_11_o <= state_11_o;
    end
end

// int_state_11_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_11_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_11_o_ap_vld)
            int_state_11_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_11_O_CTRL)
            int_state_11_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_12_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_12_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_12_I_DATA_0)
            int_state_12_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_12_i[31:0] & ~wmask);
    end
end

// int_state_12_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_12_o <= 0;
    else if (ACLK_EN) begin
        if (state_12_o_ap_vld)
            int_state_12_o <= state_12_o;
    end
end

// int_state_12_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_12_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_12_o_ap_vld)
            int_state_12_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_12_O_CTRL)
            int_state_12_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_13_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_13_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_13_I_DATA_0)
            int_state_13_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_13_i[31:0] & ~wmask);
    end
end

// int_state_13_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_13_o <= 0;
    else if (ACLK_EN) begin
        if (state_13_o_ap_vld)
            int_state_13_o <= state_13_o;
    end
end

// int_state_13_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_13_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_13_o_ap_vld)
            int_state_13_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_13_O_CTRL)
            int_state_13_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_14_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_14_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_14_I_DATA_0)
            int_state_14_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_14_i[31:0] & ~wmask);
    end
end

// int_state_14_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_14_o <= 0;
    else if (ACLK_EN) begin
        if (state_14_o_ap_vld)
            int_state_14_o <= state_14_o;
    end
end

// int_state_14_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_14_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_14_o_ap_vld)
            int_state_14_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_14_O_CTRL)
            int_state_14_o_ap_vld <= 1'b0; // clear on read
    end
end

// int_state_15_i[31:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_state_15_i[31:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_STATE_15_I_DATA_0)
            int_state_15_i[31:0] <= (WDATA[31:0] & wmask) | (int_state_15_i[31:0] & ~wmask);
    end
end

// int_state_15_o
always @(posedge ACLK) begin
    if (ARESET)
        int_state_15_o <= 0;
    else if (ACLK_EN) begin
        if (state_15_o_ap_vld)
            int_state_15_o <= state_15_o;
    end
end

// int_state_15_o_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_state_15_o_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (state_15_o_ap_vld)
            int_state_15_o_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_STATE_15_O_CTRL)
            int_state_15_o_ap_vld <= 1'b0; // clear on read
    end
end

//synthesis translate_off
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (int_gie & ~int_isr[0] & int_ier[0] & ap_done)
            $display ("// Interrupt Monitor : interrupt for ap_done detected @ \"%0t\"", $time);
        if (int_gie & ~int_isr[1] & int_ier[1] & ap_ready)
            $display ("// Interrupt Monitor : interrupt for ap_ready detected @ \"%0t\"", $time);
    end
end
//synthesis translate_on

//------------------------Memory logic-------------------

endmodule

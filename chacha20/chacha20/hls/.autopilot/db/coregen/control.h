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

#define CONTROL_ADDR_AP_CTRL         0x000
#define CONTROL_ADDR_GIE             0x004
#define CONTROL_ADDR_IER             0x008
#define CONTROL_ADDR_ISR             0x00c
#define CONTROL_ADDR_STATE_0_I_DATA  0x010
#define CONTROL_BITS_STATE_0_I_DATA  32
#define CONTROL_ADDR_STATE_0_O_DATA  0x018
#define CONTROL_BITS_STATE_0_O_DATA  32
#define CONTROL_ADDR_STATE_0_O_CTRL  0x01c
#define CONTROL_ADDR_STATE_1_I_DATA  0x020
#define CONTROL_BITS_STATE_1_I_DATA  32
#define CONTROL_ADDR_STATE_1_O_DATA  0x028
#define CONTROL_BITS_STATE_1_O_DATA  32
#define CONTROL_ADDR_STATE_1_O_CTRL  0x02c
#define CONTROL_ADDR_STATE_2_I_DATA  0x030
#define CONTROL_BITS_STATE_2_I_DATA  32
#define CONTROL_ADDR_STATE_2_O_DATA  0x038
#define CONTROL_BITS_STATE_2_O_DATA  32
#define CONTROL_ADDR_STATE_2_O_CTRL  0x03c
#define CONTROL_ADDR_STATE_3_I_DATA  0x040
#define CONTROL_BITS_STATE_3_I_DATA  32
#define CONTROL_ADDR_STATE_3_O_DATA  0x048
#define CONTROL_BITS_STATE_3_O_DATA  32
#define CONTROL_ADDR_STATE_3_O_CTRL  0x04c
#define CONTROL_ADDR_STATE_4_I_DATA  0x050
#define CONTROL_BITS_STATE_4_I_DATA  32
#define CONTROL_ADDR_STATE_4_O_DATA  0x058
#define CONTROL_BITS_STATE_4_O_DATA  32
#define CONTROL_ADDR_STATE_4_O_CTRL  0x05c
#define CONTROL_ADDR_STATE_5_I_DATA  0x060
#define CONTROL_BITS_STATE_5_I_DATA  32
#define CONTROL_ADDR_STATE_5_O_DATA  0x068
#define CONTROL_BITS_STATE_5_O_DATA  32
#define CONTROL_ADDR_STATE_5_O_CTRL  0x06c
#define CONTROL_ADDR_STATE_6_I_DATA  0x070
#define CONTROL_BITS_STATE_6_I_DATA  32
#define CONTROL_ADDR_STATE_6_O_DATA  0x078
#define CONTROL_BITS_STATE_6_O_DATA  32
#define CONTROL_ADDR_STATE_6_O_CTRL  0x07c
#define CONTROL_ADDR_STATE_7_I_DATA  0x080
#define CONTROL_BITS_STATE_7_I_DATA  32
#define CONTROL_ADDR_STATE_7_O_DATA  0x088
#define CONTROL_BITS_STATE_7_O_DATA  32
#define CONTROL_ADDR_STATE_7_O_CTRL  0x08c
#define CONTROL_ADDR_STATE_8_I_DATA  0x090
#define CONTROL_BITS_STATE_8_I_DATA  32
#define CONTROL_ADDR_STATE_8_O_DATA  0x098
#define CONTROL_BITS_STATE_8_O_DATA  32
#define CONTROL_ADDR_STATE_8_O_CTRL  0x09c
#define CONTROL_ADDR_STATE_9_I_DATA  0x0a0
#define CONTROL_BITS_STATE_9_I_DATA  32
#define CONTROL_ADDR_STATE_9_O_DATA  0x0a8
#define CONTROL_BITS_STATE_9_O_DATA  32
#define CONTROL_ADDR_STATE_9_O_CTRL  0x0ac
#define CONTROL_ADDR_STATE_10_I_DATA 0x0b0
#define CONTROL_BITS_STATE_10_I_DATA 32
#define CONTROL_ADDR_STATE_10_O_DATA 0x0b8
#define CONTROL_BITS_STATE_10_O_DATA 32
#define CONTROL_ADDR_STATE_10_O_CTRL 0x0bc
#define CONTROL_ADDR_STATE_11_I_DATA 0x0c0
#define CONTROL_BITS_STATE_11_I_DATA 32
#define CONTROL_ADDR_STATE_11_O_DATA 0x0c8
#define CONTROL_BITS_STATE_11_O_DATA 32
#define CONTROL_ADDR_STATE_11_O_CTRL 0x0cc
#define CONTROL_ADDR_STATE_12_I_DATA 0x0d0
#define CONTROL_BITS_STATE_12_I_DATA 32
#define CONTROL_ADDR_STATE_12_O_DATA 0x0d8
#define CONTROL_BITS_STATE_12_O_DATA 32
#define CONTROL_ADDR_STATE_12_O_CTRL 0x0dc
#define CONTROL_ADDR_STATE_13_I_DATA 0x0e0
#define CONTROL_BITS_STATE_13_I_DATA 32
#define CONTROL_ADDR_STATE_13_O_DATA 0x0e8
#define CONTROL_BITS_STATE_13_O_DATA 32
#define CONTROL_ADDR_STATE_13_O_CTRL 0x0ec
#define CONTROL_ADDR_STATE_14_I_DATA 0x0f0
#define CONTROL_BITS_STATE_14_I_DATA 32
#define CONTROL_ADDR_STATE_14_O_DATA 0x0f8
#define CONTROL_BITS_STATE_14_O_DATA 32
#define CONTROL_ADDR_STATE_14_O_CTRL 0x0fc
#define CONTROL_ADDR_STATE_15_I_DATA 0x100
#define CONTROL_BITS_STATE_15_I_DATA 32
#define CONTROL_ADDR_STATE_15_O_DATA 0x108
#define CONTROL_BITS_STATE_15_O_DATA 32
#define CONTROL_ADDR_STATE_15_O_CTRL 0x10c

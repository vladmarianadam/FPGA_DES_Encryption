-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
-- Tool Version Limit: 2025.11
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- 
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity chacha20_kernel_control_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 9;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    interrupt             :out  STD_LOGIC;
    state_0_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_0_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_0_o_ap_vld      :in   STD_LOGIC;
    state_1_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_1_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_1_o_ap_vld      :in   STD_LOGIC;
    state_2_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_2_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_2_o_ap_vld      :in   STD_LOGIC;
    state_3_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_3_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_3_o_ap_vld      :in   STD_LOGIC;
    state_4_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_4_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_4_o_ap_vld      :in   STD_LOGIC;
    state_5_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_5_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_5_o_ap_vld      :in   STD_LOGIC;
    state_6_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_6_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_6_o_ap_vld      :in   STD_LOGIC;
    state_7_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_7_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_7_o_ap_vld      :in   STD_LOGIC;
    state_8_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_8_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_8_o_ap_vld      :in   STD_LOGIC;
    state_9_i             :out  STD_LOGIC_VECTOR(31 downto 0);
    state_9_o             :in   STD_LOGIC_VECTOR(31 downto 0);
    state_9_o_ap_vld      :in   STD_LOGIC;
    state_10_i            :out  STD_LOGIC_VECTOR(31 downto 0);
    state_10_o            :in   STD_LOGIC_VECTOR(31 downto 0);
    state_10_o_ap_vld     :in   STD_LOGIC;
    state_11_i            :out  STD_LOGIC_VECTOR(31 downto 0);
    state_11_o            :in   STD_LOGIC_VECTOR(31 downto 0);
    state_11_o_ap_vld     :in   STD_LOGIC;
    state_12_i            :out  STD_LOGIC_VECTOR(31 downto 0);
    state_12_o            :in   STD_LOGIC_VECTOR(31 downto 0);
    state_12_o_ap_vld     :in   STD_LOGIC;
    state_13_i            :out  STD_LOGIC_VECTOR(31 downto 0);
    state_13_o            :in   STD_LOGIC_VECTOR(31 downto 0);
    state_13_o_ap_vld     :in   STD_LOGIC;
    state_14_i            :out  STD_LOGIC_VECTOR(31 downto 0);
    state_14_o            :in   STD_LOGIC_VECTOR(31 downto 0);
    state_14_o_ap_vld     :in   STD_LOGIC;
    state_15_i            :out  STD_LOGIC_VECTOR(31 downto 0);
    state_15_o            :in   STD_LOGIC_VECTOR(31 downto 0);
    state_15_o_ap_vld     :in   STD_LOGIC;
    ap_start              :out  STD_LOGIC;
    ap_done               :in   STD_LOGIC;
    ap_ready              :in   STD_LOGIC;
    ap_idle               :in   STD_LOGIC
);
end entity chacha20_kernel_control_s_axi;

-- ------------------------Address Info-------------------
-- Protocol Used: ap_ctrl_hs
--
-- 0x000 : Control signals
--         bit 0  - ap_start (Read/Write/COH)
--         bit 1  - ap_done (Read/COR)
--         bit 2  - ap_idle (Read)
--         bit 3  - ap_ready (Read/COR)
--         bit 7  - auto_restart (Read/Write)
--         bit 9  - interrupt (Read)
--         others - reserved
-- 0x004 : Global Interrupt Enable Register
--         bit 0  - Global Interrupt Enable (Read/Write)
--         others - reserved
-- 0x008 : IP Interrupt Enable Register (Read/Write)
--         bit 0 - enable ap_done interrupt (Read/Write)
--         bit 1 - enable ap_ready interrupt (Read/Write)
--         others - reserved
-- 0x00c : IP Interrupt Status Register (Read/TOW)
--         bit 0 - ap_done (Read/TOW)
--         bit 1 - ap_ready (Read/TOW)
--         others - reserved
-- 0x010 : Data signal of state_0_i
--         bit 31~0 - state_0_i[31:0] (Read/Write)
-- 0x014 : reserved
-- 0x018 : Data signal of state_0_o
--         bit 31~0 - state_0_o[31:0] (Read)
-- 0x01c : Control signal of state_0_o
--         bit 0  - state_0_o_ap_vld (Read/COR)
--         others - reserved
-- 0x020 : Data signal of state_1_i
--         bit 31~0 - state_1_i[31:0] (Read/Write)
-- 0x024 : reserved
-- 0x028 : Data signal of state_1_o
--         bit 31~0 - state_1_o[31:0] (Read)
-- 0x02c : Control signal of state_1_o
--         bit 0  - state_1_o_ap_vld (Read/COR)
--         others - reserved
-- 0x030 : Data signal of state_2_i
--         bit 31~0 - state_2_i[31:0] (Read/Write)
-- 0x034 : reserved
-- 0x038 : Data signal of state_2_o
--         bit 31~0 - state_2_o[31:0] (Read)
-- 0x03c : Control signal of state_2_o
--         bit 0  - state_2_o_ap_vld (Read/COR)
--         others - reserved
-- 0x040 : Data signal of state_3_i
--         bit 31~0 - state_3_i[31:0] (Read/Write)
-- 0x044 : reserved
-- 0x048 : Data signal of state_3_o
--         bit 31~0 - state_3_o[31:0] (Read)
-- 0x04c : Control signal of state_3_o
--         bit 0  - state_3_o_ap_vld (Read/COR)
--         others - reserved
-- 0x050 : Data signal of state_4_i
--         bit 31~0 - state_4_i[31:0] (Read/Write)
-- 0x054 : reserved
-- 0x058 : Data signal of state_4_o
--         bit 31~0 - state_4_o[31:0] (Read)
-- 0x05c : Control signal of state_4_o
--         bit 0  - state_4_o_ap_vld (Read/COR)
--         others - reserved
-- 0x060 : Data signal of state_5_i
--         bit 31~0 - state_5_i[31:0] (Read/Write)
-- 0x064 : reserved
-- 0x068 : Data signal of state_5_o
--         bit 31~0 - state_5_o[31:0] (Read)
-- 0x06c : Control signal of state_5_o
--         bit 0  - state_5_o_ap_vld (Read/COR)
--         others - reserved
-- 0x070 : Data signal of state_6_i
--         bit 31~0 - state_6_i[31:0] (Read/Write)
-- 0x074 : reserved
-- 0x078 : Data signal of state_6_o
--         bit 31~0 - state_6_o[31:0] (Read)
-- 0x07c : Control signal of state_6_o
--         bit 0  - state_6_o_ap_vld (Read/COR)
--         others - reserved
-- 0x080 : Data signal of state_7_i
--         bit 31~0 - state_7_i[31:0] (Read/Write)
-- 0x084 : reserved
-- 0x088 : Data signal of state_7_o
--         bit 31~0 - state_7_o[31:0] (Read)
-- 0x08c : Control signal of state_7_o
--         bit 0  - state_7_o_ap_vld (Read/COR)
--         others - reserved
-- 0x090 : Data signal of state_8_i
--         bit 31~0 - state_8_i[31:0] (Read/Write)
-- 0x094 : reserved
-- 0x098 : Data signal of state_8_o
--         bit 31~0 - state_8_o[31:0] (Read)
-- 0x09c : Control signal of state_8_o
--         bit 0  - state_8_o_ap_vld (Read/COR)
--         others - reserved
-- 0x0a0 : Data signal of state_9_i
--         bit 31~0 - state_9_i[31:0] (Read/Write)
-- 0x0a4 : reserved
-- 0x0a8 : Data signal of state_9_o
--         bit 31~0 - state_9_o[31:0] (Read)
-- 0x0ac : Control signal of state_9_o
--         bit 0  - state_9_o_ap_vld (Read/COR)
--         others - reserved
-- 0x0b0 : Data signal of state_10_i
--         bit 31~0 - state_10_i[31:0] (Read/Write)
-- 0x0b4 : reserved
-- 0x0b8 : Data signal of state_10_o
--         bit 31~0 - state_10_o[31:0] (Read)
-- 0x0bc : Control signal of state_10_o
--         bit 0  - state_10_o_ap_vld (Read/COR)
--         others - reserved
-- 0x0c0 : Data signal of state_11_i
--         bit 31~0 - state_11_i[31:0] (Read/Write)
-- 0x0c4 : reserved
-- 0x0c8 : Data signal of state_11_o
--         bit 31~0 - state_11_o[31:0] (Read)
-- 0x0cc : Control signal of state_11_o
--         bit 0  - state_11_o_ap_vld (Read/COR)
--         others - reserved
-- 0x0d0 : Data signal of state_12_i
--         bit 31~0 - state_12_i[31:0] (Read/Write)
-- 0x0d4 : reserved
-- 0x0d8 : Data signal of state_12_o
--         bit 31~0 - state_12_o[31:0] (Read)
-- 0x0dc : Control signal of state_12_o
--         bit 0  - state_12_o_ap_vld (Read/COR)
--         others - reserved
-- 0x0e0 : Data signal of state_13_i
--         bit 31~0 - state_13_i[31:0] (Read/Write)
-- 0x0e4 : reserved
-- 0x0e8 : Data signal of state_13_o
--         bit 31~0 - state_13_o[31:0] (Read)
-- 0x0ec : Control signal of state_13_o
--         bit 0  - state_13_o_ap_vld (Read/COR)
--         others - reserved
-- 0x0f0 : Data signal of state_14_i
--         bit 31~0 - state_14_i[31:0] (Read/Write)
-- 0x0f4 : reserved
-- 0x0f8 : Data signal of state_14_o
--         bit 31~0 - state_14_o[31:0] (Read)
-- 0x0fc : Control signal of state_14_o
--         bit 0  - state_14_o_ap_vld (Read/COR)
--         others - reserved
-- 0x100 : Data signal of state_15_i
--         bit 31~0 - state_15_i[31:0] (Read/Write)
-- 0x104 : reserved
-- 0x108 : Data signal of state_15_o
--         bit 31~0 - state_15_o[31:0] (Read)
-- 0x10c : Control signal of state_15_o
--         bit 0  - state_15_o_ap_vld (Read/COR)
--         others - reserved
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of chacha20_kernel_control_s_axi is
attribute DowngradeIPIdentifiedWarnings : STRING;
attribute DowngradeIPIdentifiedWarnings of behave : architecture is "yes";
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_AP_CTRL           : INTEGER := 16#000#;
    constant ADDR_GIE               : INTEGER := 16#004#;
    constant ADDR_IER               : INTEGER := 16#008#;
    constant ADDR_ISR               : INTEGER := 16#00c#;
    constant ADDR_STATE_0_I_DATA_0  : INTEGER := 16#010#;
    constant ADDR_STATE_0_I_CTRL    : INTEGER := 16#014#;
    constant ADDR_STATE_0_O_DATA_0  : INTEGER := 16#018#;
    constant ADDR_STATE_0_O_CTRL    : INTEGER := 16#01c#;
    constant ADDR_STATE_1_I_DATA_0  : INTEGER := 16#020#;
    constant ADDR_STATE_1_I_CTRL    : INTEGER := 16#024#;
    constant ADDR_STATE_1_O_DATA_0  : INTEGER := 16#028#;
    constant ADDR_STATE_1_O_CTRL    : INTEGER := 16#02c#;
    constant ADDR_STATE_2_I_DATA_0  : INTEGER := 16#030#;
    constant ADDR_STATE_2_I_CTRL    : INTEGER := 16#034#;
    constant ADDR_STATE_2_O_DATA_0  : INTEGER := 16#038#;
    constant ADDR_STATE_2_O_CTRL    : INTEGER := 16#03c#;
    constant ADDR_STATE_3_I_DATA_0  : INTEGER := 16#040#;
    constant ADDR_STATE_3_I_CTRL    : INTEGER := 16#044#;
    constant ADDR_STATE_3_O_DATA_0  : INTEGER := 16#048#;
    constant ADDR_STATE_3_O_CTRL    : INTEGER := 16#04c#;
    constant ADDR_STATE_4_I_DATA_0  : INTEGER := 16#050#;
    constant ADDR_STATE_4_I_CTRL    : INTEGER := 16#054#;
    constant ADDR_STATE_4_O_DATA_0  : INTEGER := 16#058#;
    constant ADDR_STATE_4_O_CTRL    : INTEGER := 16#05c#;
    constant ADDR_STATE_5_I_DATA_0  : INTEGER := 16#060#;
    constant ADDR_STATE_5_I_CTRL    : INTEGER := 16#064#;
    constant ADDR_STATE_5_O_DATA_0  : INTEGER := 16#068#;
    constant ADDR_STATE_5_O_CTRL    : INTEGER := 16#06c#;
    constant ADDR_STATE_6_I_DATA_0  : INTEGER := 16#070#;
    constant ADDR_STATE_6_I_CTRL    : INTEGER := 16#074#;
    constant ADDR_STATE_6_O_DATA_0  : INTEGER := 16#078#;
    constant ADDR_STATE_6_O_CTRL    : INTEGER := 16#07c#;
    constant ADDR_STATE_7_I_DATA_0  : INTEGER := 16#080#;
    constant ADDR_STATE_7_I_CTRL    : INTEGER := 16#084#;
    constant ADDR_STATE_7_O_DATA_0  : INTEGER := 16#088#;
    constant ADDR_STATE_7_O_CTRL    : INTEGER := 16#08c#;
    constant ADDR_STATE_8_I_DATA_0  : INTEGER := 16#090#;
    constant ADDR_STATE_8_I_CTRL    : INTEGER := 16#094#;
    constant ADDR_STATE_8_O_DATA_0  : INTEGER := 16#098#;
    constant ADDR_STATE_8_O_CTRL    : INTEGER := 16#09c#;
    constant ADDR_STATE_9_I_DATA_0  : INTEGER := 16#0a0#;
    constant ADDR_STATE_9_I_CTRL    : INTEGER := 16#0a4#;
    constant ADDR_STATE_9_O_DATA_0  : INTEGER := 16#0a8#;
    constant ADDR_STATE_9_O_CTRL    : INTEGER := 16#0ac#;
    constant ADDR_STATE_10_I_DATA_0 : INTEGER := 16#0b0#;
    constant ADDR_STATE_10_I_CTRL   : INTEGER := 16#0b4#;
    constant ADDR_STATE_10_O_DATA_0 : INTEGER := 16#0b8#;
    constant ADDR_STATE_10_O_CTRL   : INTEGER := 16#0bc#;
    constant ADDR_STATE_11_I_DATA_0 : INTEGER := 16#0c0#;
    constant ADDR_STATE_11_I_CTRL   : INTEGER := 16#0c4#;
    constant ADDR_STATE_11_O_DATA_0 : INTEGER := 16#0c8#;
    constant ADDR_STATE_11_O_CTRL   : INTEGER := 16#0cc#;
    constant ADDR_STATE_12_I_DATA_0 : INTEGER := 16#0d0#;
    constant ADDR_STATE_12_I_CTRL   : INTEGER := 16#0d4#;
    constant ADDR_STATE_12_O_DATA_0 : INTEGER := 16#0d8#;
    constant ADDR_STATE_12_O_CTRL   : INTEGER := 16#0dc#;
    constant ADDR_STATE_13_I_DATA_0 : INTEGER := 16#0e0#;
    constant ADDR_STATE_13_I_CTRL   : INTEGER := 16#0e4#;
    constant ADDR_STATE_13_O_DATA_0 : INTEGER := 16#0e8#;
    constant ADDR_STATE_13_O_CTRL   : INTEGER := 16#0ec#;
    constant ADDR_STATE_14_I_DATA_0 : INTEGER := 16#0f0#;
    constant ADDR_STATE_14_I_CTRL   : INTEGER := 16#0f4#;
    constant ADDR_STATE_14_O_DATA_0 : INTEGER := 16#0f8#;
    constant ADDR_STATE_14_O_CTRL   : INTEGER := 16#0fc#;
    constant ADDR_STATE_15_I_DATA_0 : INTEGER := 16#100#;
    constant ADDR_STATE_15_I_CTRL   : INTEGER := 16#104#;
    constant ADDR_STATE_15_O_DATA_0 : INTEGER := 16#108#;
    constant ADDR_STATE_15_O_CTRL   : INTEGER := 16#10c#;
    constant ADDR_BITS         : INTEGER := 9;

    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    signal BVALID_t            : STD_LOGIC;
    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    -- internal registers
    signal int_ap_idle         : STD_LOGIC := '0';
    signal int_ap_ready        : STD_LOGIC := '0';
    signal task_ap_ready       : STD_LOGIC;
    signal int_ap_done         : STD_LOGIC := '0';
    signal task_ap_done        : STD_LOGIC;
    signal int_task_ap_done    : STD_LOGIC := '0';
    signal int_ap_start        : STD_LOGIC := '0';
    signal int_interrupt       : STD_LOGIC := '0';
    signal int_auto_restart    : STD_LOGIC := '0';
    signal auto_restart_status : STD_LOGIC := '0';
    signal auto_restart_done   : STD_LOGIC;
    signal int_gie             : STD_LOGIC := '0';
    signal int_ier             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_isr             : UNSIGNED(1 downto 0) := (others => '0');
    signal int_state_0_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_0_o_ap_vld : STD_LOGIC;
    signal int_state_0_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_1_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_1_o_ap_vld : STD_LOGIC;
    signal int_state_1_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_2_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_2_o_ap_vld : STD_LOGIC;
    signal int_state_2_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_3_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_3_o_ap_vld : STD_LOGIC;
    signal int_state_3_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_4_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_4_o_ap_vld : STD_LOGIC;
    signal int_state_4_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_5_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_5_o_ap_vld : STD_LOGIC;
    signal int_state_5_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_6_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_6_o_ap_vld : STD_LOGIC;
    signal int_state_6_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_7_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_7_o_ap_vld : STD_LOGIC;
    signal int_state_7_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_8_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_8_o_ap_vld : STD_LOGIC;
    signal int_state_8_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_9_i       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_9_o_ap_vld : STD_LOGIC;
    signal int_state_9_o       : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_10_i      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_10_o_ap_vld : STD_LOGIC;
    signal int_state_10_o      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_11_i      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_11_o_ap_vld : STD_LOGIC;
    signal int_state_11_o      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_12_i      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_12_o_ap_vld : STD_LOGIC;
    signal int_state_12_o      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_13_i      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_13_o_ap_vld : STD_LOGIC;
    signal int_state_13_o      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_14_i      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_14_o_ap_vld : STD_LOGIC;
    signal int_state_14_o      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_15_i      : UNSIGNED(31 downto 0) := (others => '0');
    signal int_state_15_o_ap_vld : STD_LOGIC;
    signal int_state_15_o      : UNSIGNED(31 downto 0) := (others => '0');


begin
-- ----------------------- Instantiation------------------


-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BVALID_t  <=  '1' when wstate = wrresp else '0';
    BVALID    <=  BVALID_t;
    BRESP     <=  "00";  -- OKAY
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY, BVALID_t)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1' and BVALID_t = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 2) & (1 downto 0 => '0'));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    rdata_data <= (others => '0');
                    case (TO_INTEGER(raddr)) is
                    when ADDR_AP_CTRL =>
                        rdata_data(9) <= int_interrupt;
                        rdata_data(7) <= int_auto_restart;
                        rdata_data(3) <= int_ap_ready;
                        rdata_data(2) <= int_ap_idle;
                        rdata_data(1) <= int_task_ap_done;
                        rdata_data(0) <= int_ap_start;
                    when ADDR_GIE =>
                        rdata_data(0) <= int_gie;
                    when ADDR_IER =>
                        rdata_data(1 downto 0) <= int_ier;
                    when ADDR_ISR =>
                        rdata_data(1 downto 0) <= int_isr;
                    when ADDR_STATE_0_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_0_i(31 downto 0), 32);
                    when ADDR_STATE_0_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_0_o(31 downto 0), 32);
                    when ADDR_STATE_0_O_CTRL =>
                        rdata_data(0) <= int_state_0_o_ap_vld;
                    when ADDR_STATE_1_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_1_i(31 downto 0), 32);
                    when ADDR_STATE_1_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_1_o(31 downto 0), 32);
                    when ADDR_STATE_1_O_CTRL =>
                        rdata_data(0) <= int_state_1_o_ap_vld;
                    when ADDR_STATE_2_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_2_i(31 downto 0), 32);
                    when ADDR_STATE_2_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_2_o(31 downto 0), 32);
                    when ADDR_STATE_2_O_CTRL =>
                        rdata_data(0) <= int_state_2_o_ap_vld;
                    when ADDR_STATE_3_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_3_i(31 downto 0), 32);
                    when ADDR_STATE_3_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_3_o(31 downto 0), 32);
                    when ADDR_STATE_3_O_CTRL =>
                        rdata_data(0) <= int_state_3_o_ap_vld;
                    when ADDR_STATE_4_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_4_i(31 downto 0), 32);
                    when ADDR_STATE_4_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_4_o(31 downto 0), 32);
                    when ADDR_STATE_4_O_CTRL =>
                        rdata_data(0) <= int_state_4_o_ap_vld;
                    when ADDR_STATE_5_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_5_i(31 downto 0), 32);
                    when ADDR_STATE_5_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_5_o(31 downto 0), 32);
                    when ADDR_STATE_5_O_CTRL =>
                        rdata_data(0) <= int_state_5_o_ap_vld;
                    when ADDR_STATE_6_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_6_i(31 downto 0), 32);
                    when ADDR_STATE_6_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_6_o(31 downto 0), 32);
                    when ADDR_STATE_6_O_CTRL =>
                        rdata_data(0) <= int_state_6_o_ap_vld;
                    when ADDR_STATE_7_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_7_i(31 downto 0), 32);
                    when ADDR_STATE_7_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_7_o(31 downto 0), 32);
                    when ADDR_STATE_7_O_CTRL =>
                        rdata_data(0) <= int_state_7_o_ap_vld;
                    when ADDR_STATE_8_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_8_i(31 downto 0), 32);
                    when ADDR_STATE_8_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_8_o(31 downto 0), 32);
                    when ADDR_STATE_8_O_CTRL =>
                        rdata_data(0) <= int_state_8_o_ap_vld;
                    when ADDR_STATE_9_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_9_i(31 downto 0), 32);
                    when ADDR_STATE_9_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_9_o(31 downto 0), 32);
                    when ADDR_STATE_9_O_CTRL =>
                        rdata_data(0) <= int_state_9_o_ap_vld;
                    when ADDR_STATE_10_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_10_i(31 downto 0), 32);
                    when ADDR_STATE_10_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_10_o(31 downto 0), 32);
                    when ADDR_STATE_10_O_CTRL =>
                        rdata_data(0) <= int_state_10_o_ap_vld;
                    when ADDR_STATE_11_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_11_i(31 downto 0), 32);
                    when ADDR_STATE_11_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_11_o(31 downto 0), 32);
                    when ADDR_STATE_11_O_CTRL =>
                        rdata_data(0) <= int_state_11_o_ap_vld;
                    when ADDR_STATE_12_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_12_i(31 downto 0), 32);
                    when ADDR_STATE_12_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_12_o(31 downto 0), 32);
                    when ADDR_STATE_12_O_CTRL =>
                        rdata_data(0) <= int_state_12_o_ap_vld;
                    when ADDR_STATE_13_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_13_i(31 downto 0), 32);
                    when ADDR_STATE_13_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_13_o(31 downto 0), 32);
                    when ADDR_STATE_13_O_CTRL =>
                        rdata_data(0) <= int_state_13_o_ap_vld;
                    when ADDR_STATE_14_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_14_i(31 downto 0), 32);
                    when ADDR_STATE_14_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_14_o(31 downto 0), 32);
                    when ADDR_STATE_14_O_CTRL =>
                        rdata_data(0) <= int_state_14_o_ap_vld;
                    when ADDR_STATE_15_I_DATA_0 =>
                        rdata_data <= RESIZE(int_state_15_i(31 downto 0), 32);
                    when ADDR_STATE_15_O_DATA_0 =>
                        rdata_data <= RESIZE(int_state_15_o(31 downto 0), 32);
                    when ADDR_STATE_15_O_CTRL =>
                        rdata_data(0) <= int_state_15_o_ap_vld;
                    when others =>
                        NULL;
                    end case;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    interrupt            <= int_interrupt;
    ap_start             <= int_ap_start;
    task_ap_done         <= (ap_done and not auto_restart_status) or auto_restart_done;
    task_ap_ready        <= ap_ready and not int_auto_restart;
    auto_restart_done    <= auto_restart_status and (ap_idle and not int_ap_idle);
    state_0_i            <= STD_LOGIC_VECTOR(int_state_0_i);
    state_1_i            <= STD_LOGIC_VECTOR(int_state_1_i);
    state_2_i            <= STD_LOGIC_VECTOR(int_state_2_i);
    state_3_i            <= STD_LOGIC_VECTOR(int_state_3_i);
    state_4_i            <= STD_LOGIC_VECTOR(int_state_4_i);
    state_5_i            <= STD_LOGIC_VECTOR(int_state_5_i);
    state_6_i            <= STD_LOGIC_VECTOR(int_state_6_i);
    state_7_i            <= STD_LOGIC_VECTOR(int_state_7_i);
    state_8_i            <= STD_LOGIC_VECTOR(int_state_8_i);
    state_9_i            <= STD_LOGIC_VECTOR(int_state_9_i);
    state_10_i           <= STD_LOGIC_VECTOR(int_state_10_i);
    state_11_i           <= STD_LOGIC_VECTOR(int_state_11_i);
    state_12_i           <= STD_LOGIC_VECTOR(int_state_12_i);
    state_13_i           <= STD_LOGIC_VECTOR(int_state_13_i);
    state_14_i           <= STD_LOGIC_VECTOR(int_state_14_i);
    state_15_i           <= STD_LOGIC_VECTOR(int_state_15_i);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_interrupt <= '0';
            elsif (ACLK_EN = '1') then
                if (int_gie = '1' and (int_isr(0) or int_isr(1)) = '1') then
                    int_interrupt <= '1';
                else
                    int_interrupt <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_start <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1' and WDATA(0) = '1') then
                    int_ap_start <= '1';
                elsif (ap_ready = '1') then
                    int_ap_start <= int_auto_restart; -- clear on handshake/auto restart
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_done <= ap_done;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_task_ap_done <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_done = '1') then
                    int_task_ap_done <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_task_ap_done <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_idle <= '0';
            elsif (ACLK_EN = '1') then
                if (true) then
                    int_ap_idle <= ap_idle;
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ap_ready <= '0';
            elsif (ACLK_EN = '1') then
                if (task_ap_ready = '1') then
                    int_ap_ready <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_AP_CTRL) then
                    int_ap_ready <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_auto_restart <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_AP_CTRL and WSTRB(0) = '1') then
                    int_auto_restart <= WDATA(7);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                auto_restart_status <= '0';
            elsif (ACLK_EN = '1') then
                if (int_auto_restart = '1') then
                    auto_restart_status <= '1';
                elsif (ap_idle = '1') then
                    auto_restart_status <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_gie <= '0';
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_GIE and WSTRB(0) = '1') then
                    int_gie <= WDATA(0);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_ier <= (others=>'0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_IER and WSTRB(0) = '1') then
                    int_ier <= UNSIGNED(WDATA(1 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(0) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(0) = '1' and ap_done = '1') then
                    int_isr(0) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(0) <= int_isr(0) xor WDATA(0); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_isr(1) <= '0';
            elsif (ACLK_EN = '1') then
                if (int_ier(1) = '1' and ap_ready = '1') then
                    int_isr(1) <= '1';
                elsif (w_hs = '1' and waddr = ADDR_ISR and WSTRB(0) = '1') then
                    int_isr(1) <= int_isr(1) xor WDATA(1); -- toggle on write
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_0_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_0_I_DATA_0) then
                    int_state_0_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_0_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_0_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_0_o_ap_vld = '1') then
                    int_state_0_o <= UNSIGNED(state_0_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_0_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_0_o_ap_vld = '1') then
                    int_state_0_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_0_O_CTRL) then
                    int_state_0_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_1_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_1_I_DATA_0) then
                    int_state_1_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_1_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_1_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_1_o_ap_vld = '1') then
                    int_state_1_o <= UNSIGNED(state_1_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_1_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_1_o_ap_vld = '1') then
                    int_state_1_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_1_O_CTRL) then
                    int_state_1_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_2_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_2_I_DATA_0) then
                    int_state_2_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_2_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_2_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_2_o_ap_vld = '1') then
                    int_state_2_o <= UNSIGNED(state_2_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_2_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_2_o_ap_vld = '1') then
                    int_state_2_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_2_O_CTRL) then
                    int_state_2_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_3_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_3_I_DATA_0) then
                    int_state_3_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_3_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_3_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_3_o_ap_vld = '1') then
                    int_state_3_o <= UNSIGNED(state_3_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_3_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_3_o_ap_vld = '1') then
                    int_state_3_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_3_O_CTRL) then
                    int_state_3_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_4_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_4_I_DATA_0) then
                    int_state_4_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_4_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_4_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_4_o_ap_vld = '1') then
                    int_state_4_o <= UNSIGNED(state_4_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_4_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_4_o_ap_vld = '1') then
                    int_state_4_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_4_O_CTRL) then
                    int_state_4_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_5_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_5_I_DATA_0) then
                    int_state_5_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_5_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_5_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_5_o_ap_vld = '1') then
                    int_state_5_o <= UNSIGNED(state_5_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_5_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_5_o_ap_vld = '1') then
                    int_state_5_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_5_O_CTRL) then
                    int_state_5_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_6_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_6_I_DATA_0) then
                    int_state_6_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_6_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_6_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_6_o_ap_vld = '1') then
                    int_state_6_o <= UNSIGNED(state_6_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_6_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_6_o_ap_vld = '1') then
                    int_state_6_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_6_O_CTRL) then
                    int_state_6_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_7_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_7_I_DATA_0) then
                    int_state_7_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_7_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_7_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_7_o_ap_vld = '1') then
                    int_state_7_o <= UNSIGNED(state_7_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_7_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_7_o_ap_vld = '1') then
                    int_state_7_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_7_O_CTRL) then
                    int_state_7_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_8_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_8_I_DATA_0) then
                    int_state_8_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_8_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_8_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_8_o_ap_vld = '1') then
                    int_state_8_o <= UNSIGNED(state_8_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_8_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_8_o_ap_vld = '1') then
                    int_state_8_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_8_O_CTRL) then
                    int_state_8_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_9_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_9_I_DATA_0) then
                    int_state_9_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_9_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_9_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_9_o_ap_vld = '1') then
                    int_state_9_o <= UNSIGNED(state_9_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_9_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_9_o_ap_vld = '1') then
                    int_state_9_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_9_O_CTRL) then
                    int_state_9_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_10_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_10_I_DATA_0) then
                    int_state_10_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_10_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_10_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_10_o_ap_vld = '1') then
                    int_state_10_o <= UNSIGNED(state_10_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_10_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_10_o_ap_vld = '1') then
                    int_state_10_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_10_O_CTRL) then
                    int_state_10_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_11_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_11_I_DATA_0) then
                    int_state_11_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_11_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_11_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_11_o_ap_vld = '1') then
                    int_state_11_o <= UNSIGNED(state_11_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_11_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_11_o_ap_vld = '1') then
                    int_state_11_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_11_O_CTRL) then
                    int_state_11_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_12_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_12_I_DATA_0) then
                    int_state_12_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_12_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_12_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_12_o_ap_vld = '1') then
                    int_state_12_o <= UNSIGNED(state_12_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_12_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_12_o_ap_vld = '1') then
                    int_state_12_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_12_O_CTRL) then
                    int_state_12_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_13_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_13_I_DATA_0) then
                    int_state_13_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_13_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_13_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_13_o_ap_vld = '1') then
                    int_state_13_o <= UNSIGNED(state_13_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_13_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_13_o_ap_vld = '1') then
                    int_state_13_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_13_O_CTRL) then
                    int_state_13_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_14_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_14_I_DATA_0) then
                    int_state_14_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_14_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_14_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_14_o_ap_vld = '1') then
                    int_state_14_o <= UNSIGNED(state_14_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_14_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_14_o_ap_vld = '1') then
                    int_state_14_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_14_O_CTRL) then
                    int_state_14_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_15_i(31 downto 0) <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_STATE_15_I_DATA_0) then
                    int_state_15_i(31 downto 0) <= (UNSIGNED(WDATA(31 downto 0)) and wmask(31 downto 0)) or ((not wmask(31 downto 0)) and int_state_15_i(31 downto 0));
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_15_o <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (state_15_o_ap_vld = '1') then
                    int_state_15_o <= UNSIGNED(state_15_o);
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_state_15_o_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (state_15_o_ap_vld = '1') then
                    int_state_15_o_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_STATE_15_O_CTRL) then
                    int_state_15_o_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------

end architecture behave;

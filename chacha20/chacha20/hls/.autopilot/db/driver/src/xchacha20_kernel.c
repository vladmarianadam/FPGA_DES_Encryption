// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xchacha20_kernel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XChacha20_kernel_CfgInitialize(XChacha20_kernel *InstancePtr, XChacha20_kernel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XChacha20_kernel_Start(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XChacha20_kernel_IsDone(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XChacha20_kernel_IsIdle(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XChacha20_kernel_IsReady(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XChacha20_kernel_EnableAutoRestart(XChacha20_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XChacha20_kernel_DisableAutoRestart(XChacha20_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XChacha20_kernel_Set_state_0_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_0_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_0_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_0_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_0_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_0_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_0_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_0_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_1_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_1_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_1_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_1_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_1_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_1_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_1_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_1_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_2_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_2_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_2_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_2_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_2_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_2_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_2_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_2_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_3_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_3_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_3_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_3_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_3_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_3_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_3_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_3_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_4_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_4_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_4_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_4_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_4_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_4_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_4_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_4_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_5_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_5_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_5_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_5_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_5_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_5_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_5_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_5_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_6_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_6_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_6_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_6_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_6_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_6_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_6_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_6_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_7_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_7_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_7_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_7_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_7_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_7_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_7_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_7_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_8_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_8_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_8_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_8_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_8_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_8_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_8_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_8_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_9_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_9_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_9_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_9_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_9_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_9_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_9_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_9_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_10_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_10_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_10_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_10_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_10_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_10_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_10_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_10_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_11_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_11_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_11_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_11_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_11_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_11_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_11_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_11_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_12_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_12_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_12_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_12_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_12_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_12_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_12_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_12_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_13_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_13_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_13_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_13_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_13_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_13_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_13_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_13_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_14_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_14_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_14_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_14_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_14_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_14_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_14_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_14_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_Set_state_15_i(XChacha20_kernel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_15_I_DATA, Data);
}

u32 XChacha20_kernel_Get_state_15_i(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_15_I_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_15_o(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_15_O_DATA);
    return Data;
}

u32 XChacha20_kernel_Get_state_15_o_vld(XChacha20_kernel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_STATE_15_O_CTRL);
    return Data & 0x1;
}

void XChacha20_kernel_InterruptGlobalEnable(XChacha20_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_GIE, 1);
}

void XChacha20_kernel_InterruptGlobalDisable(XChacha20_kernel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_GIE, 0);
}

void XChacha20_kernel_InterruptEnable(XChacha20_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_IER);
    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_IER, Register | Mask);
}

void XChacha20_kernel_InterruptDisable(XChacha20_kernel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_IER);
    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XChacha20_kernel_InterruptClear(XChacha20_kernel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XChacha20_kernel_WriteReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_ISR, Mask);
}

u32 XChacha20_kernel_InterruptGetEnabled(XChacha20_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_IER);
}

u32 XChacha20_kernel_InterruptGetStatus(XChacha20_kernel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XChacha20_kernel_ReadReg(InstancePtr->Control_BaseAddress, XCHACHA20_KERNEL_CONTROL_ADDR_ISR);
}


// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XCHACHA20_KERNEL_H
#define XCHACHA20_KERNEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xchacha20_kernel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XChacha20_kernel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XChacha20_kernel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XChacha20_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XChacha20_kernel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XChacha20_kernel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XChacha20_kernel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XChacha20_kernel_Initialize(XChacha20_kernel *InstancePtr, UINTPTR BaseAddress);
XChacha20_kernel_Config* XChacha20_kernel_LookupConfig(UINTPTR BaseAddress);
#else
int XChacha20_kernel_Initialize(XChacha20_kernel *InstancePtr, u16 DeviceId);
XChacha20_kernel_Config* XChacha20_kernel_LookupConfig(u16 DeviceId);
#endif
int XChacha20_kernel_CfgInitialize(XChacha20_kernel *InstancePtr, XChacha20_kernel_Config *ConfigPtr);
#else
int XChacha20_kernel_Initialize(XChacha20_kernel *InstancePtr, const char* InstanceName);
int XChacha20_kernel_Release(XChacha20_kernel *InstancePtr);
#endif

void XChacha20_kernel_Start(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_IsDone(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_IsIdle(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_IsReady(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_EnableAutoRestart(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_DisableAutoRestart(XChacha20_kernel *InstancePtr);

void XChacha20_kernel_Set_state_0_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_0_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_0_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_0_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_1_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_1_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_1_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_1_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_2_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_2_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_2_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_2_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_3_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_3_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_3_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_3_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_4_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_4_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_4_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_4_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_5_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_5_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_5_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_5_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_6_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_6_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_6_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_6_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_7_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_7_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_7_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_7_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_8_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_8_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_8_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_8_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_9_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_9_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_9_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_9_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_10_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_10_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_10_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_10_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_11_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_11_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_11_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_11_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_12_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_12_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_12_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_12_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_13_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_13_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_13_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_13_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_14_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_14_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_14_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_14_o_vld(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_Set_state_15_i(XChacha20_kernel *InstancePtr, u32 Data);
u32 XChacha20_kernel_Get_state_15_i(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_15_o(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_Get_state_15_o_vld(XChacha20_kernel *InstancePtr);

void XChacha20_kernel_InterruptGlobalEnable(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_InterruptGlobalDisable(XChacha20_kernel *InstancePtr);
void XChacha20_kernel_InterruptEnable(XChacha20_kernel *InstancePtr, u32 Mask);
void XChacha20_kernel_InterruptDisable(XChacha20_kernel *InstancePtr, u32 Mask);
void XChacha20_kernel_InterruptClear(XChacha20_kernel *InstancePtr, u32 Mask);
u32 XChacha20_kernel_InterruptGetEnabled(XChacha20_kernel *InstancePtr);
u32 XChacha20_kernel_InterruptGetStatus(XChacha20_kernel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif

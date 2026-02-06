// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2025.2 (64-bit)
// Tool Version Limit: 2025.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xchacha20_kernel.h"

extern XChacha20_kernel_Config XChacha20_kernel_ConfigTable[];

#ifdef SDT
XChacha20_kernel_Config *XChacha20_kernel_LookupConfig(UINTPTR BaseAddress) {
	XChacha20_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XChacha20_kernel_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XChacha20_kernel_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XChacha20_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XChacha20_kernel_Initialize(XChacha20_kernel *InstancePtr, UINTPTR BaseAddress) {
	XChacha20_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XChacha20_kernel_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XChacha20_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XChacha20_kernel_Config *XChacha20_kernel_LookupConfig(u16 DeviceId) {
	XChacha20_kernel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XCHACHA20_KERNEL_NUM_INSTANCES; Index++) {
		if (XChacha20_kernel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XChacha20_kernel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XChacha20_kernel_Initialize(XChacha20_kernel *InstancePtr, u16 DeviceId) {
	XChacha20_kernel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XChacha20_kernel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XChacha20_kernel_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif


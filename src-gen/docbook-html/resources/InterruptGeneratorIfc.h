/* Copyright (C) 2024 Eccelerators GmbH
   
   This code was generated by:
  
   HxS Compiler v0.0.0-0000000
   C Extension for HxS 1.0.24-85d98215
   
   Further information at https://eccelerators.com/hxs
   
   Changes to this file may cause incorrect behavior and will be lost if the
   code is regenerated.
*/	
	
#ifndef _InterruptGeneratorIfc_H
#define _InterruptGeneratorIfc_H

/* ----------------------------------------------------- */
/* Addresses, widths, values and masks for direct access */
/* ----------------------------------------------------- */
#define InterruptGeneratorIfcAddressBusWidth 7
#define InterruptGeneratorIfcDataBusWidth 32

#define InterruptGeneratorBlkAddress 0x00
#define InterruptGeneratorBlkSize 0x58

#define ControlRegAddress (0x00 + InterruptGeneratorBlkAddress)
#define ControlRegWidth 32

#define ControlReg_ChannelOperation3Mask 0x00000008
#define ControlReg_ChannelOperation3Position 3
#define ControlReg_ChannelOperation3Width 1
#define ControlReg_ChannelOperation3_DisabledMVal 0x00000000
#define ControlReg_ChannelOperation3_EnabledMVal 0x00000008
#define ControlReg_ChannelOperation3BusResetMRstVal 0x00000000

#define ControlReg_ChannelOperation2Mask 0x00000004
#define ControlReg_ChannelOperation2Position 2
#define ControlReg_ChannelOperation2Width 1
#define ControlReg_ChannelOperation2_DisabledMVal 0x00000000
#define ControlReg_ChannelOperation2_EnabledMVal 0x00000004
#define ControlReg_ChannelOperation2BusResetMRstVal 0x00000000

#define ControlReg_ChannelOperation1Mask 0x00000002
#define ControlReg_ChannelOperation1Position 1
#define ControlReg_ChannelOperation1Width 1
#define ControlReg_ChannelOperation1_DisabledMVal 0x00000000
#define ControlReg_ChannelOperation1_EnabledMVal 0x00000002
#define ControlReg_ChannelOperation1BusResetMRstVal 0x00000000

#define ControlReg_ChannelOperation0Mask 0x00000001
#define ControlReg_ChannelOperation0Position 0
#define ControlReg_ChannelOperation0Width 1
#define ControlReg_ChannelOperation0_DisabledMVal 0x00000000
#define ControlReg_ChannelOperation0_EnabledMVal 0x00000001
#define ControlReg_ChannelOperation0BusResetMRstVal 0x00000000

#define StatusRegAddress (0x04 + InterruptGeneratorBlkAddress)
#define StatusRegWidth 32

#define StatusReg_ChannelStatus3Mask 0x000000C0
#define StatusReg_ChannelStatus3Position 6
#define StatusReg_ChannelStatus3Width 2
#define StatusReg_ChannelStatus3_IdleMVal 0x00000000
#define StatusReg_ChannelStatus3_OperatingMVal 0x00000040
#define StatusReg_ChannelStatus3_EndedMValAMask 0x00000080
#define StatusReg_ChannelStatus3_EndedMValListSize 2
#define StatusReg_ChannelStatus3_EndedMValList { \
    0x00000080, 0x000000C0};

#define StatusReg_ChannelStatus2Mask 0x00000030
#define StatusReg_ChannelStatus2Position 4
#define StatusReg_ChannelStatus2Width 2
#define StatusReg_ChannelStatus2_IdleMVal 0x00000000
#define StatusReg_ChannelStatus2_OperatingMVal 0x00000010
#define StatusReg_ChannelStatus2_EndedMValAMask 0x00000020
#define StatusReg_ChannelStatus2_EndedMValListSize 2
#define StatusReg_ChannelStatus2_EndedMValList { \
    0x00000020, 0x00000030};

#define StatusReg_ChannelStatus1Mask 0x0000000C
#define StatusReg_ChannelStatus1Position 2
#define StatusReg_ChannelStatus1Width 2
#define StatusReg_ChannelStatus1_IdleMVal 0x00000000
#define StatusReg_ChannelStatus1_OperatingMVal 0x00000004
#define StatusReg_ChannelStatus1_EndedMValAMask 0x00000008
#define StatusReg_ChannelStatus1_EndedMValListSize 2
#define StatusReg_ChannelStatus1_EndedMValList { \
    0x00000008, 0x0000000C};

#define StatusReg_ChannelStatus0Mask 0x00000003
#define StatusReg_ChannelStatus0Position 0
#define StatusReg_ChannelStatus0Width 2
#define StatusReg_ChannelStatus0_IdleMVal 0x00000000
#define StatusReg_ChannelStatus0_OperatingMVal 0x00000001
#define StatusReg_ChannelStatus0_EndedMValAMask 0x00000002
#define StatusReg_ChannelStatus0_EndedMValListSize 2
#define StatusReg_ChannelStatus0_EndedMValList { \
    0x00000002, 0x00000003};

#define ChargedCountReg0Address (0x08 + InterruptGeneratorBlkAddress)
#define ChargedCountReg0Width 32

#define ChargedCountReg0_CountMask 0xFFFFFFFF
#define ChargedCountReg0_CountPosition 0
#define ChargedCountReg0_CountWidth 32
#define ChargedCountReg0_CountBusResetMRstVal 0x00000000

#define ChargedCountReg1Address (0x0C + InterruptGeneratorBlkAddress)
#define ChargedCountReg1Width 32

#define ChargedCountReg1_CountMask 0xFFFFFFFF
#define ChargedCountReg1_CountPosition 0
#define ChargedCountReg1_CountWidth 32
#define ChargedCountReg1_CountBusResetMRstVal 0x00000000

#define ChargedCountReg2Address (0x10 + InterruptGeneratorBlkAddress)
#define ChargedCountReg2Width 32

#define ChargedCountReg2_CountMask 0xFFFFFFFF
#define ChargedCountReg2_CountPosition 0
#define ChargedCountReg2_CountWidth 32
#define ChargedCountReg2_CountBusResetMRstVal 0x00000000

#define ChargedCountReg3Address (0x14 + InterruptGeneratorBlkAddress)
#define ChargedCountReg3Width 32

#define ChargedCountReg3_CountMask 0xFFFFFFFF
#define ChargedCountReg3_CountPosition 0
#define ChargedCountReg3_CountWidth 32
#define ChargedCountReg3_CountBusResetMRstVal 0x00000000

#define ActualCountReg0Address (0x18 + InterruptGeneratorBlkAddress)
#define ActualCountReg0Width 32

#define ActualCountReg0_CountMask 0xFFFFFFFF
#define ActualCountReg0_CountPosition 0
#define ActualCountReg0_CountWidth 32

#define ActualCountReg1Address (0x1C + InterruptGeneratorBlkAddress)
#define ActualCountReg1Width 32

#define ActualCountReg1_CountMask 0xFFFFFFFF
#define ActualCountReg1_CountPosition 0
#define ActualCountReg1_CountWidth 32

#define ActualCountReg2Address (0x20 + InterruptGeneratorBlkAddress)
#define ActualCountReg2Width 32

#define ActualCountReg2_CountMask 0xFFFFFFFF
#define ActualCountReg2_CountPosition 0
#define ActualCountReg2_CountWidth 32

#define ActualCountReg3Address (0x24 + InterruptGeneratorBlkAddress)
#define ActualCountReg3Width 32

#define ActualCountReg3_CountMask 0xFFFFFFFF
#define ActualCountReg3_CountPosition 0
#define ActualCountReg3_CountWidth 32

#define FailureCountReg0Address (0x28 + InterruptGeneratorBlkAddress)
#define FailureCountReg0Width 32

#define FailureCountReg0_CountMask 0xFFFFFFFF
#define FailureCountReg0_CountPosition 0
#define FailureCountReg0_CountWidth 32

#define FailureCountReg1Address (0x2C + InterruptGeneratorBlkAddress)
#define FailureCountReg1Width 32

#define FailureCountReg1_CountMask 0xFFFFFFFF
#define FailureCountReg1_CountPosition 0
#define FailureCountReg1_CountWidth 32

#define FailureCountReg2Address (0x30 + InterruptGeneratorBlkAddress)
#define FailureCountReg2Width 32

#define FailureCountReg2_CountMask 0xFFFFFFFF
#define FailureCountReg2_CountPosition 0
#define FailureCountReg2_CountWidth 32

#define FailureCountReg3Address (0x34 + InterruptGeneratorBlkAddress)
#define FailureCountReg3Width 32

#define FailureCountReg3_CountMask 0xFFFFFFFF
#define FailureCountReg3_CountPosition 0
#define FailureCountReg3_CountWidth 32

#define IntervalReg0Address (0x38 + InterruptGeneratorBlkAddress)
#define IntervalReg0Width 32

#define IntervalReg0_IntervalMask 0xFFFFFFFF
#define IntervalReg0_IntervalPosition 0
#define IntervalReg0_IntervalWidth 32
#define IntervalReg0_IntervalBusResetMRstVal 0x00000000

#define IntervalReg1Address (0x3C + InterruptGeneratorBlkAddress)
#define IntervalReg1Width 32

#define IntervalReg1_IntervalMask 0xFFFFFFFF
#define IntervalReg1_IntervalPosition 0
#define IntervalReg1_IntervalWidth 32
#define IntervalReg1_IntervalBusResetMRstVal 0x00000000

#define IntervalReg2Address (0x40 + InterruptGeneratorBlkAddress)
#define IntervalReg2Width 32

#define IntervalReg2_IntervalMask 0xFFFFFFFF
#define IntervalReg2_IntervalPosition 0
#define IntervalReg2_IntervalWidth 32
#define IntervalReg2_IntervalBusResetMRstVal 0x00000000

#define IntervalReg3Address (0x44 + InterruptGeneratorBlkAddress)
#define IntervalReg3Width 32

#define IntervalReg3_IntervalMask 0xFFFFFFFF
#define IntervalReg3_IntervalPosition 0
#define IntervalReg3_IntervalWidth 32
#define IntervalReg3_IntervalBusResetMRstVal 0x00000000

#define ReferenceCountReg0Address (0x48 + InterruptGeneratorBlkAddress)
#define ReferenceCountReg0Width 32

#define ReferenceCountReg0_CountMask 0xFFFFFFFF
#define ReferenceCountReg0_CountPosition 0
#define ReferenceCountReg0_CountWidth 32
#define ReferenceCountReg0_CountBusResetMRstVal 0x00000000

#define ReferenceCountReg1Address (0x4C + InterruptGeneratorBlkAddress)
#define ReferenceCountReg1Width 32

#define ReferenceCountReg1_CountMask 0xFFFFFFFF
#define ReferenceCountReg1_CountPosition 0
#define ReferenceCountReg1_CountWidth 32
#define ReferenceCountReg1_CountBusResetMRstVal 0x00000000

#define ReferenceCountReg2Address (0x50 + InterruptGeneratorBlkAddress)
#define ReferenceCountReg2Width 32

#define ReferenceCountReg2_CountMask 0xFFFFFFFF
#define ReferenceCountReg2_CountPosition 0
#define ReferenceCountReg2_CountWidth 32
#define ReferenceCountReg2_CountBusResetMRstVal 0x00000000

#define ReferenceCountReg3Address (0x54 + InterruptGeneratorBlkAddress)
#define ReferenceCountReg3Width 32

#define ReferenceCountReg3_CountMask 0xFFFFFFFF
#define ReferenceCountReg3_CountPosition 0
#define ReferenceCountReg3_CountWidth 32
#define ReferenceCountReg3_CountBusResetMRstVal 0x00000000

#endif

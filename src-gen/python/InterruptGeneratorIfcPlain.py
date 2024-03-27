# Copyright (C) 2024 Eccelerators GmbH
# 
# This code was generated by:
#
# HxS Compiler v0.0.0-0000000
# Python Extension for HxS 1.0.7-62bb9ef4
# 
# Further information at https://eccelerators.com/hxs
# 
# Changes to this file may cause incorrect behavior and will be lost if the
# code is regenerated.
	
	
# -----------------------------------------------------
# Addresses, widths, values and masks for direct access
# -----------------------------------------------------
InterruptGeneratorIfcAddressBusWidth = 7
InterruptGeneratorIfcDataBusWidth = 32

class InterruptGeneratorBlk:
    InterruptGeneratorBlkAddress = 0x00 
    InterruptGeneratorBlkSize = 0x58 

    @property
    def ControlRegAddress(self):
        return (0x00 + self.InterruptGeneratorBlkAddress)

    ControlRegWidth = 32

    ControlReg_ChannelOperation3Mask = 0x00000008
    ControlReg_ChannelOperation3Position = 3
    ControlReg_ChannelOperation3Width = 1
    ControlReg_ChannelOperation3_DisabledMVal = 0x00000000
    ControlReg_ChannelOperation3_EnabledMVal = 0x00000008
    ControlReg_ChannelOperation3BusResetMRstVal = 0x00000000

    ControlReg_ChannelOperation2Mask = 0x00000004
    ControlReg_ChannelOperation2Position = 2
    ControlReg_ChannelOperation2Width = 1
    ControlReg_ChannelOperation2_DisabledMVal = 0x00000000
    ControlReg_ChannelOperation2_EnabledMVal = 0x00000004
    ControlReg_ChannelOperation2BusResetMRstVal = 0x00000000

    ControlReg_ChannelOperation1Mask = 0x00000002
    ControlReg_ChannelOperation1Position = 1
    ControlReg_ChannelOperation1Width = 1
    ControlReg_ChannelOperation1_DisabledMVal = 0x00000000
    ControlReg_ChannelOperation1_EnabledMVal = 0x00000002
    ControlReg_ChannelOperation1BusResetMRstVal = 0x00000000

    ControlReg_ChannelOperation0Mask = 0x00000001
    ControlReg_ChannelOperation0Position = 0
    ControlReg_ChannelOperation0Width = 1
    ControlReg_ChannelOperation0_DisabledMVal = 0x00000000
    ControlReg_ChannelOperation0_EnabledMVal = 0x00000001
    ControlReg_ChannelOperation0BusResetMRstVal = 0x00000000


    @property
    def StatusRegAddress(self):
        return (0x04 + self.InterruptGeneratorBlkAddress)

    StatusRegWidth = 32

    StatusReg_ChannelStatus3Mask = 0x000000C0
    StatusReg_ChannelStatus3Position = 6
    StatusReg_ChannelStatus3Width = 2
    StatusReg_ChannelStatus3_IdleMVal = 0x00000000
    StatusReg_ChannelStatus3_OperatingMVal = 0x00000040
    StatusReg_ChannelStatus3_EndedMValAMask = 0x00000080
    StatusReg_ChannelStatus3_EndedMValList = [
        0x00000080, 0x000000C0]

    StatusReg_ChannelStatus2Mask = 0x00000030
    StatusReg_ChannelStatus2Position = 4
    StatusReg_ChannelStatus2Width = 2
    StatusReg_ChannelStatus2_IdleMVal = 0x00000000
    StatusReg_ChannelStatus2_OperatingMVal = 0x00000010
    StatusReg_ChannelStatus2_EndedMValAMask = 0x00000020
    StatusReg_ChannelStatus2_EndedMValList = [
        0x00000020, 0x00000030]

    StatusReg_ChannelStatus1Mask = 0x0000000C
    StatusReg_ChannelStatus1Position = 2
    StatusReg_ChannelStatus1Width = 2
    StatusReg_ChannelStatus1_IdleMVal = 0x00000000
    StatusReg_ChannelStatus1_OperatingMVal = 0x00000004
    StatusReg_ChannelStatus1_EndedMValAMask = 0x00000008
    StatusReg_ChannelStatus1_EndedMValList = [
        0x00000008, 0x0000000C]

    StatusReg_ChannelStatus0Mask = 0x00000003
    StatusReg_ChannelStatus0Position = 0
    StatusReg_ChannelStatus0Width = 2
    StatusReg_ChannelStatus0_IdleMVal = 0x00000000
    StatusReg_ChannelStatus0_OperatingMVal = 0x00000001
    StatusReg_ChannelStatus0_EndedMValAMask = 0x00000002
    StatusReg_ChannelStatus0_EndedMValList = [
        0x00000002, 0x00000003]


    @property
    def ChargedCountReg0Address(self):
        return (0x08 + self.InterruptGeneratorBlkAddress)

    ChargedCountReg0Width = 32

    ChargedCountReg0_CountMask = 0xFFFFFFFF
    ChargedCountReg0_CountPosition = 0
    ChargedCountReg0_CountWidth = 32
    ChargedCountReg0_CountBusResetMRstVal = 0x00000000


    @property
    def ChargedCountReg1Address(self):
        return (0x0C + self.InterruptGeneratorBlkAddress)

    ChargedCountReg1Width = 32

    ChargedCountReg1_CountMask = 0xFFFFFFFF
    ChargedCountReg1_CountPosition = 0
    ChargedCountReg1_CountWidth = 32
    ChargedCountReg1_CountBusResetMRstVal = 0x00000000


    @property
    def ChargedCountReg2Address(self):
        return (0x10 + self.InterruptGeneratorBlkAddress)

    ChargedCountReg2Width = 32

    ChargedCountReg2_CountMask = 0xFFFFFFFF
    ChargedCountReg2_CountPosition = 0
    ChargedCountReg2_CountWidth = 32
    ChargedCountReg2_CountBusResetMRstVal = 0x00000000


    @property
    def ChargedCountReg3Address(self):
        return (0x14 + self.InterruptGeneratorBlkAddress)

    ChargedCountReg3Width = 32

    ChargedCountReg3_CountMask = 0xFFFFFFFF
    ChargedCountReg3_CountPosition = 0
    ChargedCountReg3_CountWidth = 32
    ChargedCountReg3_CountBusResetMRstVal = 0x00000000


    @property
    def ActualCountReg0Address(self):
        return (0x18 + self.InterruptGeneratorBlkAddress)

    ActualCountReg0Width = 32

    ActualCountReg0_CountMask = 0xFFFFFFFF
    ActualCountReg0_CountPosition = 0
    ActualCountReg0_CountWidth = 32


    @property
    def ActualCountReg1Address(self):
        return (0x1C + self.InterruptGeneratorBlkAddress)

    ActualCountReg1Width = 32

    ActualCountReg1_CountMask = 0xFFFFFFFF
    ActualCountReg1_CountPosition = 0
    ActualCountReg1_CountWidth = 32


    @property
    def ActualCountReg2Address(self):
        return (0x20 + self.InterruptGeneratorBlkAddress)

    ActualCountReg2Width = 32

    ActualCountReg2_CountMask = 0xFFFFFFFF
    ActualCountReg2_CountPosition = 0
    ActualCountReg2_CountWidth = 32


    @property
    def ActualCountReg3Address(self):
        return (0x24 + self.InterruptGeneratorBlkAddress)

    ActualCountReg3Width = 32

    ActualCountReg3_CountMask = 0xFFFFFFFF
    ActualCountReg3_CountPosition = 0
    ActualCountReg3_CountWidth = 32


    @property
    def FailureCountReg0Address(self):
        return (0x28 + self.InterruptGeneratorBlkAddress)

    FailureCountReg0Width = 32

    FailureCountReg0_CountMask = 0xFFFFFFFF
    FailureCountReg0_CountPosition = 0
    FailureCountReg0_CountWidth = 32


    @property
    def FailureCountReg1Address(self):
        return (0x2C + self.InterruptGeneratorBlkAddress)

    FailureCountReg1Width = 32

    FailureCountReg1_CountMask = 0xFFFFFFFF
    FailureCountReg1_CountPosition = 0
    FailureCountReg1_CountWidth = 32


    @property
    def FailureCountReg2Address(self):
        return (0x30 + self.InterruptGeneratorBlkAddress)

    FailureCountReg2Width = 32

    FailureCountReg2_CountMask = 0xFFFFFFFF
    FailureCountReg2_CountPosition = 0
    FailureCountReg2_CountWidth = 32


    @property
    def FailureCountReg3Address(self):
        return (0x34 + self.InterruptGeneratorBlkAddress)

    FailureCountReg3Width = 32

    FailureCountReg3_CountMask = 0xFFFFFFFF
    FailureCountReg3_CountPosition = 0
    FailureCountReg3_CountWidth = 32


    @property
    def IntervalReg0Address(self):
        return (0x38 + self.InterruptGeneratorBlkAddress)

    IntervalReg0Width = 32

    IntervalReg0_IntervalMask = 0xFFFFFFFF
    IntervalReg0_IntervalPosition = 0
    IntervalReg0_IntervalWidth = 32
    IntervalReg0_IntervalBusResetMRstVal = 0x00000000


    @property
    def IntervalReg1Address(self):
        return (0x3C + self.InterruptGeneratorBlkAddress)

    IntervalReg1Width = 32

    IntervalReg1_IntervalMask = 0xFFFFFFFF
    IntervalReg1_IntervalPosition = 0
    IntervalReg1_IntervalWidth = 32
    IntervalReg1_IntervalBusResetMRstVal = 0x00000000


    @property
    def IntervalReg2Address(self):
        return (0x40 + self.InterruptGeneratorBlkAddress)

    IntervalReg2Width = 32

    IntervalReg2_IntervalMask = 0xFFFFFFFF
    IntervalReg2_IntervalPosition = 0
    IntervalReg2_IntervalWidth = 32
    IntervalReg2_IntervalBusResetMRstVal = 0x00000000


    @property
    def IntervalReg3Address(self):
        return (0x44 + self.InterruptGeneratorBlkAddress)

    IntervalReg3Width = 32

    IntervalReg3_IntervalMask = 0xFFFFFFFF
    IntervalReg3_IntervalPosition = 0
    IntervalReg3_IntervalWidth = 32
    IntervalReg3_IntervalBusResetMRstVal = 0x00000000


    @property
    def ReferenceCountReg0Address(self):
        return (0x48 + self.InterruptGeneratorBlkAddress)

    ReferenceCountReg0Width = 32

    ReferenceCountReg0_CountMask = 0xFFFFFFFF
    ReferenceCountReg0_CountPosition = 0
    ReferenceCountReg0_CountWidth = 32
    ReferenceCountReg0_CountBusResetMRstVal = 0x00000000


    @property
    def ReferenceCountReg1Address(self):
        return (0x4C + self.InterruptGeneratorBlkAddress)

    ReferenceCountReg1Width = 32

    ReferenceCountReg1_CountMask = 0xFFFFFFFF
    ReferenceCountReg1_CountPosition = 0
    ReferenceCountReg1_CountWidth = 32
    ReferenceCountReg1_CountBusResetMRstVal = 0x00000000


    @property
    def ReferenceCountReg2Address(self):
        return (0x50 + self.InterruptGeneratorBlkAddress)

    ReferenceCountReg2Width = 32

    ReferenceCountReg2_CountMask = 0xFFFFFFFF
    ReferenceCountReg2_CountPosition = 0
    ReferenceCountReg2_CountWidth = 32
    ReferenceCountReg2_CountBusResetMRstVal = 0x00000000


    @property
    def ReferenceCountReg3Address(self):
        return (0x54 + self.InterruptGeneratorBlkAddress)

    ReferenceCountReg3Width = 32

    ReferenceCountReg3_CountMask = 0xFFFFFFFF
    ReferenceCountReg3_CountPosition = 0
    ReferenceCountReg3_CountWidth = 32
    ReferenceCountReg3_CountBusResetMRstVal = 0x00000000

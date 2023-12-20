-- Copyright (C) 2023 Eccelerators GmbH
-- 
-- This code was generated by:
--
-- HxS Compiler 1.0.19-10671667
-- VHDL Extension for HxS 1.0.21-b962bd24
-- 
-- Further information at https://eccelerators.com/hxs
-- 
-- Changes to this file may cause incorrect behavior and will be lost if the
-- code is regenerated.
library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

package InterruptGeneratorIfcPackage is

	type T_InterruptGeneratorIfcAvalonDown is
	record
		Address : std_logic_vector(6 downto 0);
		ByteEnable : std_logic_vector(3 downto 0);
		Write : std_logic;
		WriteData : std_logic_vector(31 downto 0);
		Read : std_logic;
	end record;
	
	type T_InterruptGeneratorIfcAvalonUp is
	record
		ReadData : std_logic_vector(31 downto 0);
		WaitRequest : std_logic;
	end record;
	
	type T_InterruptGeneratorIfcTrace is
	record
		AvalonDown : T_InterruptGeneratorIfcAvalonDown;
		AvalonUp : T_InterruptGeneratorIfcAvalonUp;
		UnoccupiedAck : std_logic;
		TimeoutAck : std_logic;
	end record;
	
	type T_InterruptGeneratorIfcInterruptGeneratorBlkDown is
	record
		ControlReg_ChannelOperation0 : std_logic;
		ControlReg_ChannelOperation1 : std_logic;
		ControlReg_ChannelOperation2 : std_logic;
		ControlReg_ChannelOperation3 : std_logic;
		ChargedCountReg0_Count : std_logic_vector(31 downto 0);
		ChargedCountReg1_Count : std_logic_vector(31 downto 0);
		ChargedCountReg2_Count : std_logic_vector(31 downto 0);
		ChargedCountReg3_Count : std_logic_vector(31 downto 0);
		IntervalReg0_Interval : std_logic_vector(31 downto 0);
		IntervalReg1_Interval : std_logic_vector(31 downto 0);
		IntervalReg2_Interval : std_logic_vector(31 downto 0);
		IntervalReg3_Interval : std_logic_vector(31 downto 0);
		ReferenceCountReg0_Count : std_logic_vector(31 downto 0);
		ReferenceCountReg1_Count : std_logic_vector(31 downto 0);
		ReferenceCountReg2_Count : std_logic_vector(31 downto 0);
		ReferenceCountReg3_Count : std_logic_vector(31 downto 0);
		WRegPulseReferenceCountReg0 : std_logic;
		WRegPulseReferenceCountReg1 : std_logic;
		WRegPulseReferenceCountReg2 : std_logic;
		WRegPulseReferenceCountReg3 : std_logic;
	end record;
	
	type T_InterruptGeneratorIfcInterruptGeneratorBlkUp is
	record
		StatusReg_ChannelStatus0 : std_logic_vector(1 downto 0);
		StatusReg_ChannelStatus1 : std_logic_vector(1 downto 0);
		StatusReg_ChannelStatus2 : std_logic_vector(1 downto 0);
		StatusReg_ChannelStatus3 : std_logic_vector(1 downto 0);
		ActualCountReg0_Count : std_logic_vector(31 downto 0);
		ActualCountReg1_Count : std_logic_vector(31 downto 0);
		ActualCountReg2_Count : std_logic_vector(31 downto 0);
		ActualCountReg3_Count : std_logic_vector(31 downto 0);
		FailureCountReg0_Count : std_logic_vector(31 downto 0);
		FailureCountReg1_Count : std_logic_vector(31 downto 0);
		FailureCountReg2_Count : std_logic_vector(31 downto 0);
		FailureCountReg3_Count : std_logic_vector(31 downto 0);
	end record;
	
	constant INTERRUPTGENERATORBLK_BASE_ADDRESS : std_logic_vector(6 downto 0) := "0000000";
	constant INTERRUPTGENERATORBLK_SIZE : std_logic_vector(6 downto 0) := "1010100";
	
	constant CONTROLREG_WIDTH : integer := 4;
	constant CONTROLREG_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0000000" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant CONTROLREG_CHANNELOPERATION0_POSITION : integer := 3;
	constant CONTROLREG_CHANNELOPERATION0_WIDTH : integer := 1;
	constant CONTROLREG_CHANNELOPERATION0_MASK : std_logic_vector(31 downto 0) := x"00000008";
	constant CONTROLREG_CHANNELOPERATION0_DISABLED : std_logic := '0';
	constant CONTROLREG_CHANNELOPERATION0_ENABLED : std_logic := '1';
	
	constant CONTROLREG_CHANNELOPERATION1_POSITION : integer := 2;
	constant CONTROLREG_CHANNELOPERATION1_WIDTH : integer := 1;
	constant CONTROLREG_CHANNELOPERATION1_MASK : std_logic_vector(31 downto 0) := x"00000004";
	constant CONTROLREG_CHANNELOPERATION1_DISABLED : std_logic := '0';
	constant CONTROLREG_CHANNELOPERATION1_ENABLED : std_logic := '1';
	
	constant CONTROLREG_CHANNELOPERATION2_POSITION : integer := 1;
	constant CONTROLREG_CHANNELOPERATION2_WIDTH : integer := 1;
	constant CONTROLREG_CHANNELOPERATION2_MASK : std_logic_vector(31 downto 0) := x"00000002";
	constant CONTROLREG_CHANNELOPERATION2_DISABLED : std_logic := '0';
	constant CONTROLREG_CHANNELOPERATION2_ENABLED : std_logic := '1';
	
	constant CONTROLREG_CHANNELOPERATION3_POSITION : integer := 0;
	constant CONTROLREG_CHANNELOPERATION3_WIDTH : integer := 1;
	constant CONTROLREG_CHANNELOPERATION3_MASK : std_logic_vector(31 downto 0) := x"00000001";
	constant CONTROLREG_CHANNELOPERATION3_DISABLED : std_logic := '0';
	constant CONTROLREG_CHANNELOPERATION3_ENABLED : std_logic := '1';
	
	constant STATUSREG_WIDTH : integer := 8;
	constant STATUSREG_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0000000" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant STATUSREG_CHANNELSTATUS0_POSITION : integer := 6;
	constant STATUSREG_CHANNELSTATUS0_WIDTH : integer := 2;
	constant STATUSREG_CHANNELSTATUS0_MASK : std_logic_vector(31 downto 0) := x"000000C0";
	constant STATUSREG_CHANNELSTATUS0_IDLE : std_logic_vector(1 downto 0) := "00";
	
	constant STATUSREG_CHANNELSTATUS0_OPERATING : std_logic_vector(1 downto 0) := "01";
	
	constant STATUSREG_CHANNELSTATUS0_ENDED_ASTERISK_MASK : std_logic_vector(1 downto 0) := "10";
	
	type T_STATUSREG_CHANNELSTATUS0_ENDED_LIST is array(0 to 1) of std_logic_vector(1 downto 0);
	
	constant STATUSREG_CHANNELSTATUS0_ENDED_LIST : T_STATUSREG_CHANNELSTATUS0_ENDED_LIST := (
	   "10", "11");
	
	constant STATUSREG_CHANNELSTATUS1_POSITION : integer := 4;
	constant STATUSREG_CHANNELSTATUS1_WIDTH : integer := 2;
	constant STATUSREG_CHANNELSTATUS1_MASK : std_logic_vector(31 downto 0) := x"00000030";
	constant STATUSREG_CHANNELSTATUS1_IDLE : std_logic_vector(1 downto 0) := "00";
	
	constant STATUSREG_CHANNELSTATUS1_OPERATING : std_logic_vector(1 downto 0) := "01";
	
	constant STATUSREG_CHANNELSTATUS1_ENDED_ASTERISK_MASK : std_logic_vector(1 downto 0) := "10";
	
	type T_STATUSREG_CHANNELSTATUS1_ENDED_LIST is array(0 to 1) of std_logic_vector(1 downto 0);
	
	constant STATUSREG_CHANNELSTATUS1_ENDED_LIST : T_STATUSREG_CHANNELSTATUS1_ENDED_LIST := (
	   "10", "11");
	
	constant STATUSREG_CHANNELSTATUS2_POSITION : integer := 2;
	constant STATUSREG_CHANNELSTATUS2_WIDTH : integer := 2;
	constant STATUSREG_CHANNELSTATUS2_MASK : std_logic_vector(31 downto 0) := x"0000000C";
	constant STATUSREG_CHANNELSTATUS2_IDLE : std_logic_vector(1 downto 0) := "00";
	
	constant STATUSREG_CHANNELSTATUS2_OPERATING : std_logic_vector(1 downto 0) := "01";
	
	constant STATUSREG_CHANNELSTATUS2_ENDED_ASTERISK_MASK : std_logic_vector(1 downto 0) := "10";
	
	type T_STATUSREG_CHANNELSTATUS2_ENDED_LIST is array(0 to 1) of std_logic_vector(1 downto 0);
	
	constant STATUSREG_CHANNELSTATUS2_ENDED_LIST : T_STATUSREG_CHANNELSTATUS2_ENDED_LIST := (
	   "10", "11");
	
	constant STATUSREG_CHANNELSTATUS3_POSITION : integer := 0;
	constant STATUSREG_CHANNELSTATUS3_WIDTH : integer := 2;
	constant STATUSREG_CHANNELSTATUS3_MASK : std_logic_vector(31 downto 0) := x"00000003";
	constant STATUSREG_CHANNELSTATUS3_IDLE : std_logic_vector(1 downto 0) := "00";
	
	constant STATUSREG_CHANNELSTATUS3_OPERATING : std_logic_vector(1 downto 0) := "01";
	
	constant STATUSREG_CHANNELSTATUS3_ENDED_ASTERISK_MASK : std_logic_vector(1 downto 0) := "10";
	
	type T_STATUSREG_CHANNELSTATUS3_ENDED_LIST is array(0 to 1) of std_logic_vector(1 downto 0);
	
	constant STATUSREG_CHANNELSTATUS3_ENDED_LIST : T_STATUSREG_CHANNELSTATUS3_ENDED_LIST := (
	   "10", "11");
	
	constant CHARGEDCOUNTREG0_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG0_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0000001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant CHARGEDCOUNTREG0_COUNT_POSITION : integer := 0;
	constant CHARGEDCOUNTREG0_COUNT_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG0_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant CHARGEDCOUNTREG1_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG1_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0000101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant CHARGEDCOUNTREG1_COUNT_POSITION : integer := 0;
	constant CHARGEDCOUNTREG1_COUNT_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG1_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant CHARGEDCOUNTREG2_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG2_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0001001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant CHARGEDCOUNTREG2_COUNT_POSITION : integer := 0;
	constant CHARGEDCOUNTREG2_COUNT_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG2_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant CHARGEDCOUNTREG3_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG3_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0001101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant CHARGEDCOUNTREG3_COUNT_POSITION : integer := 0;
	constant CHARGEDCOUNTREG3_COUNT_WIDTH : integer := 32;
	constant CHARGEDCOUNTREG3_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant ACTUALCOUNTREG0_WIDTH : integer := 32;
	constant ACTUALCOUNTREG0_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0010001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant ACTUALCOUNTREG0_COUNT_POSITION : integer := 0;
	constant ACTUALCOUNTREG0_COUNT_WIDTH : integer := 32;
	constant ACTUALCOUNTREG0_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant ACTUALCOUNTREG1_WIDTH : integer := 32;
	constant ACTUALCOUNTREG1_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0010101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant ACTUALCOUNTREG1_COUNT_POSITION : integer := 0;
	constant ACTUALCOUNTREG1_COUNT_WIDTH : integer := 32;
	constant ACTUALCOUNTREG1_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant ACTUALCOUNTREG2_WIDTH : integer := 32;
	constant ACTUALCOUNTREG2_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0011001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant ACTUALCOUNTREG2_COUNT_POSITION : integer := 0;
	constant ACTUALCOUNTREG2_COUNT_WIDTH : integer := 32;
	constant ACTUALCOUNTREG2_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant ACTUALCOUNTREG3_WIDTH : integer := 32;
	constant ACTUALCOUNTREG3_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0011101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant ACTUALCOUNTREG3_COUNT_POSITION : integer := 0;
	constant ACTUALCOUNTREG3_COUNT_WIDTH : integer := 32;
	constant ACTUALCOUNTREG3_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant FAILURECOUNTREG0_WIDTH : integer := 32;
	constant FAILURECOUNTREG0_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0100001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant FAILURECOUNTREG0_COUNT_POSITION : integer := 0;
	constant FAILURECOUNTREG0_COUNT_WIDTH : integer := 32;
	constant FAILURECOUNTREG0_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant FAILURECOUNTREG1_WIDTH : integer := 32;
	constant FAILURECOUNTREG1_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0100101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant FAILURECOUNTREG1_COUNT_POSITION : integer := 0;
	constant FAILURECOUNTREG1_COUNT_WIDTH : integer := 32;
	constant FAILURECOUNTREG1_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant FAILURECOUNTREG2_WIDTH : integer := 32;
	constant FAILURECOUNTREG2_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0101001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant FAILURECOUNTREG2_COUNT_POSITION : integer := 0;
	constant FAILURECOUNTREG2_COUNT_WIDTH : integer := 32;
	constant FAILURECOUNTREG2_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant FAILURECOUNTREG3_WIDTH : integer := 32;
	constant FAILURECOUNTREG3_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0101101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant FAILURECOUNTREG3_COUNT_POSITION : integer := 0;
	constant FAILURECOUNTREG3_COUNT_WIDTH : integer := 32;
	constant FAILURECOUNTREG3_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant INTERVALREG0_WIDTH : integer := 32;
	constant INTERVALREG0_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0110001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant INTERVALREG0_INTERVAL_POSITION : integer := 0;
	constant INTERVALREG0_INTERVAL_WIDTH : integer := 32;
	constant INTERVALREG0_INTERVAL_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant INTERVALREG1_WIDTH : integer := 32;
	constant INTERVALREG1_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0110101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant INTERVALREG1_INTERVAL_POSITION : integer := 0;
	constant INTERVALREG1_INTERVAL_WIDTH : integer := 32;
	constant INTERVALREG1_INTERVAL_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant INTERVALREG2_WIDTH : integer := 32;
	constant INTERVALREG2_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0111001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant INTERVALREG2_INTERVAL_POSITION : integer := 0;
	constant INTERVALREG2_INTERVAL_WIDTH : integer := 32;
	constant INTERVALREG2_INTERVAL_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant INTERVALREG3_WIDTH : integer := 32;
	constant INTERVALREG3_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("0111101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant INTERVALREG3_INTERVAL_POSITION : integer := 0;
	constant INTERVALREG3_INTERVAL_WIDTH : integer := 32;
	constant INTERVALREG3_INTERVAL_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant REFERENCECOUNTREG0_WIDTH : integer := 32;
	constant REFERENCECOUNTREG0_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("1000001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant REFERENCECOUNTREG0_COUNT_POSITION : integer := 0;
	constant REFERENCECOUNTREG0_COUNT_WIDTH : integer := 32;
	constant REFERENCECOUNTREG0_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant REFERENCECOUNTREG1_WIDTH : integer := 32;
	constant REFERENCECOUNTREG1_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("1000101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant REFERENCECOUNTREG1_COUNT_POSITION : integer := 0;
	constant REFERENCECOUNTREG1_COUNT_WIDTH : integer := 32;
	constant REFERENCECOUNTREG1_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant REFERENCECOUNTREG2_WIDTH : integer := 32;
	constant REFERENCECOUNTREG2_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("1001001" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant REFERENCECOUNTREG2_COUNT_POSITION : integer := 0;
	constant REFERENCECOUNTREG2_COUNT_WIDTH : integer := 32;
	constant REFERENCECOUNTREG2_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
	constant REFERENCECOUNTREG3_WIDTH : integer := 32;
	constant REFERENCECOUNTREG3_ADDRESS : std_logic_vector(6 downto 0) := std_logic_vector("1001101" + unsigned(INTERRUPTGENERATORBLK_BASE_ADDRESS));
	
	constant REFERENCECOUNTREG3_COUNT_POSITION : integer := 0;
	constant REFERENCECOUNTREG3_COUNT_WIDTH : integer := 32;
	constant REFERENCECOUNTREG3_COUNT_MASK : std_logic_vector(31 downto 0) := x"FFFFFFFF";
	
end;

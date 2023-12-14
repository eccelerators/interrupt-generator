-- ******************************************************************************
-- 
--                   /------o
--             eccelerators
--          o------/
-- 
--  This file is an Eccelerators GmbH sample project.
-- 
--  MIT License:
--  Copyright (c) 2023 Eccelerators GmbH
-- 
--  Permission is hereby granted, free of charge, to any person obtaining a copy
--  of this software and associated documentation files (the "Software"), to deal
--  in the Software without restriction, including without limitation the rights
--  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--  copies of the Software, and to permit persons to whom the Software is
--  furnished to do so, subject to the following conditions:
-- 
--  The above copyright notice and this permission notice shall be included in all
--  copies or substantial portions of the Software.
-- 
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--  SOFTWARE.
-- ******************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.InterruptGeneratorIfcPackage.all;
use work.InterruptGeneratorPackage.all;


entity InterruptGenerator is
    generic(ClkPeriodInNs : natural);
    port (
        Clk : in std_logic;
        Rst : in std_logic;
        InterruptOut : out std_logic_vector;
        FailureOut : out std_logic;
        ChannelOperation : in std_logic_vector;
        ChannelStatus : out std_logic_vector;
        ChargedCount : in array_of_std_logic_vector;
        ActualCount : out array_of_std_logic_vector;
        FailureCount : out array_of_std_logic_vector;
        Interval : in array_of_std_logic_vector;
        ReferenceCount : in array_of_std_logic_vector
    );
end entity;

architecture RTL of InterruptGenerator is
    
    signal IntervalCount : array_of_std_logic_vector(InterruptOut'lenght-1 downto 0)(Interval'left downto 0);
    signal IntervalEnable : std_logic_vector(InterruptOut'lenght-1 downto 0);

begin
   
    prcGenerator : process ( Clk, Rst) is
    begin
        if Rst then
            InterruptOut <= (others => '0');
            ActualCount <= (others => '0');
            IntervalCount <= (others => '0');
            IntervalEnable <= (others => '0');
            FailureOut <= '0';
        elsif rising_edge(Clk) then
            for i in 0 to InterruptOut'lenght-1 loop
            
                IntervalEnable <= (others => '0'); -- default assignment
                 
                if ChannelOperation(i) then
                    if IntervalCount(i) + ClkPeriodInNs < Interval(i) then
                        IntervalCount(i) <= IntervalCount(i) + unsigned(Interval(i));
                    else
                        IntervalCount(i) <= to_unsigned(0, Interval(i)'lenght);
                        IntervalEnable(i) <= '1';
                    end if;
                else
                    IntervalCount(i) <= to_unsigned(0, Interval(i)'lenght);
                end if;

                if ChannelOperation(i) then         
                    if IntervalEnable(i) then
                        if ActualCount(i) < ChargedCount(i) then
                            ActualCount(i) <= ActualCount(i) + 1;
                            if ActualCount(i) /= Reference(i) then
                                FailureCount(i) <= FailureCount(i) + 1;
                                FailureOut <= '1';
                            end if;
                        end if;                       
                    end if;
                else
                    FailureCount(i) <= to_unsigned(0, FailureCount(i)'lenght);
                    ActualCount(i) <= to_unsigned(0, ActualCount(i)'lenght);
                    FailureOut <= '0';
                end if;
                
                if ChannelOperation(i) then
                    if ActualCount(i) < ChargedCount(i) then
                        ChannelStatus <= STATUSREG_CHANNELSTATUS1_OPERATING;
                    else
                        ChannelStatus <= STATUSREG_CHANNELSTATUS1_ENDED_LIST(0);
                    end if;
                else
                    ChannelStatus <= STATUSREG_CHANNELSTATUS1_IDLE;
                end if;
                            
            end loop;
        end if;  
    end process;
    
end architecture;

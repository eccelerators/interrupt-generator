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

library eccelerators;
    use eccelerators.basic.all;

use work.InterruptGeneratorIfcPackage.all;


entity InterruptGenerator is
    generic(ClkPeriodInNs : natural);
    port (
        Clk : in std_logic;
        Rst : in std_logic;
        InterruptOut : out std_logic_vector;
        FailureOut : out std_logic;
        ChannelOperation : in std_logic_vector;
        ChannelStatus : out array_of_std_logic_vector;
        ChargedCount : in array_of_std_logic_vector;
        ActualCount : out array_of_std_logic_vector;
        FailureCount : out array_of_std_logic_vector;
        Interval : in array_of_std_logic_vector;
        ReferenceCount : in array_of_std_logic_vector
    );
end entity;

architecture RTL of InterruptGenerator is
    
    signal IntervalCount : array_of_std_logic_vector(InterruptOut'length-1 downto 0)(Interval'left downto 0);
    signal IntervalEnable : std_logic_vector(InterruptOut'length-1 downto 0);

begin
   
    prcGenerator : process ( Clk, Rst) is
    begin
        if Rst then
            InterruptOut <= std_logic_vector(to_unsigned(0, InterruptOut'length));
            for i in 0 to InterruptOut'length-1 loop
                ActualCount(i) <= std_logic_vector(to_unsigned(0, ActualCount(i)'length));
                IntervalCount(i) <= std_logic_vector(to_unsigned(0, IntervalCount(i)'length));
                FailureCount(i) <= std_logic_vector(to_unsigned(0, FailureCount(i)'length));
            end loop;
            IntervalEnable <= std_logic_vector(to_unsigned(0, IntervalEnable'length));
            FailureOut <= '0';
        elsif rising_edge(Clk) then
            for i in 0 to InterruptOut'length-1 loop
            
                IntervalEnable <= std_logic_vector(to_unsigned(0, IntervalEnable'length)); -- default assignment
                 
                if ChannelOperation(i) then
                    if unsigned(IntervalCount(i)) + ClkPeriodInNs < unsigned(Interval(i)) then
                        IntervalCount(i) <= std_logic_vector(unsigned(IntervalCount(i)) + unsigned(Interval(i)));
                    else
                        IntervalCount(i) <= std_logic_vector(to_unsigned(0, Interval(i)'length));
                        IntervalEnable(i) <= '1';
                        InterruptOut(i) <= '1';
                    end if;
                else
                    IntervalCount(i) <= std_logic_vector(to_unsigned(0, Interval(i)'length));
                end if;

                if ChannelOperation(i) then         
                    if IntervalEnable(i) then
                        if unsigned(ActualCount(i)) < unsigned(ChargedCount(i)) then
                            ActualCount(i) <= std_logic_vector(unsigned(ActualCount(i)) + 1);
                            if ActualCount(i) /= ReferenceCount(i) then
                                FailureCount(i) <= std_logic_vector(unsigned(FailureCount(i)) + 1);
                                FailureOut <= '1';
                            end if;
                        end if;                       
                    end if;
                else
                    FailureCount(i) <= std_logic_vector(to_unsigned(0, FailureCount(i)'length));
                    ActualCount(i) <= std_logic_vector(to_unsigned(0, ActualCount(i)'length));
                    FailureOut <= '0';
                end if;
                
                if ChannelOperation(i) then
                    if unsigned(ActualCount(i)) < unsigned(ChargedCount(i)) then
                        ChannelStatus(i) <= STATUSREG_CHANNELSTATUS1_OPERATING;
                    else
                        ChannelStatus(i) <= STATUSREG_CHANNELSTATUS1_ENDED_LIST(0);
                    end if;
                else
                    ChannelStatus(i) <= STATUSREG_CHANNELSTATUS1_IDLE;
                end if;
                            
            end loop;
        end if;  
    end process;
    
end architecture;

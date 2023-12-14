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

use work.InterruptCollectorIfcPackage.all;

entity InterruptCollector is
    generic (
        BIT_WIDTH : positive := 1
    );
    port (
        Clk : in std_logic;
        Rst : in std_logic;
        InterruptIn : in std_logic_vector(BIT_WIDTH - 1 downto 0);
        InterruptOut : out std_logic;
        Mask : in std_logic_vector(BIT_WIDTH - 1 downto 0);
        RequestWritten : in std_logic_vector(BIT_WIDTH - 1 downto 0);
        WTransPulseInterruptRequestReg : in std_logic;
        RequestToBeRead : out std_logic_vector(BIT_WIDTH - 1 downto 0);
        ServiceWritten : in std_logic_vector(BIT_WIDTH - 1 downto 0);
        WTransPulseInterruptServiceReg : in std_logic;
        ServiceToBeRead : out std_logic_vector(BIT_WIDTH - 1 downto 0)
    );
end entity;

architecture RTL of InterruptCollector is
    
    signal Request : std_logic_vector(BIT_WIDTH - 1 downto 0);
    signal Service : std_logic_vector(BIT_WIDTH - 1 downto 0);
    signal MaskedRequest : std_logic_vector(BIT_WIDTH - 1 downto 0);

begin

    MaskedRequest <= Mask and Request;
    InterruptOut <= '1' when unsigned(MaskedRequest) /= 0 else '0'; 
    RequestToBeRead <= Catch;
    ServiceToBeRead <= Overrun;
    
    prcRequestAndService : process ( Clk, Rst) is
    begin
        if Rst then
            Request <= (others => '0');
            Service <= (others => '0');
        elsif rising_edge(Clk) then
            for i in 0 to BIT_WIDTH - 1 loop
                if Service(i) then
                    Request(i) <= '0';
                elsif InterruptIn(i) then
                    Request(i) <= '1';
                end if;
                if RequestWritten(i) and WTransPulseInterruptRequestReg then
                    Service(i) <= '1';
                end if;
                if ServiceWritten(i) and WTransPulseInterruptServiceReg then
                    Service(i) <= '0';
                end if;                     
            end loop;
        end if;  
    end process;
    
end architecture;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2021 14:23:38
-- Design Name: 
-- Module Name: timer - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity timer is
generic(ClockFrequencyHz : integer:= 0);
port(
    clk           : in  std_logic;
    rst           : in  std_logic;
    Seconds_units : out std_logic_vector(3 downto 0);
    Seconds_tens  : out std_logic_vector(3 downto 0);
    Minutes_units : out std_logic_vector(3 downto 0);
    Minutes_tens  : out std_logic_vector(3 downto 0));
end entity;
 
architecture rtl of timer is
    signal Seconds : unsigned(5 downto 0); 
    signal Minutes : unsigned(5 downto 0); 
begin
 
    process(clk) is
    begin
        if rising_edge(clk) then
 
            -- If the negative reset signal is active
            if rst = '1' then
                Seconds <= (others => '0');
                Minutes <= (others => '0');
            else
 
                    -- True once every minute
                    if Seconds = 59 then
                        Seconds <= (others => '0');
 
                        -- True once every hour
                        if Minutes = 59 then
                            Minutes <= (others => '0');
                        else
                            Minutes <= Minutes + 1;
                        end if;
 
                    else
                        Seconds <= Seconds + 1;
          
                end if;
 
            end if;
        end if;
    end process;
 
    Seconds_units <= std_logic_vector(to_unsigned(to_integer(Seconds mod 10), 4)); 
    Seconds_tens <= std_logic_vector(to_unsigned(to_integer(Seconds/10),4)); 
    Minutes_units <= std_logic_vector(to_unsigned(to_integer(Minutes mod 10),4));  
    Minutes_tens <= std_logic_vector(to_unsigned(to_integer(Minutes/10),4)); 
 
end architecture;
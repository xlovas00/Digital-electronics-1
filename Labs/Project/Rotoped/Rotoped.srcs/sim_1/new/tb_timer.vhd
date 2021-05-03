----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.04.2021 14:26:35
-- Design Name: 
-- Module Name: tb_timer - Behavioral
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
 
entity tb_timer is
end entity;
 
architecture sim of tb_timer is
 
    -- We're slowing down the clock to speed up simulation time
    constant ClockFrequencyHz : integer := 100e6; -- 
    constant ClockPeriod      : time := 100 ms / ClockFrequencyHz;
 
    signal clk      : std_logic := '1';
    signal rst      : std_logic := '1';
    signal Seconds_units :  std_logic_vector(3 downto 0);
    signal Seconds_tens :  std_logic_vector(3 downto 0);
    signal Minutes_units :  std_logic_vector(3 downto 0);
    signal Minutes_tens :  std_logic_vector(3 downto 0);
 
begin
 
    -- The Device Under Test (DUT)
    i_Timer : entity work.timer(rtl)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        clk     => clk,
        rst     => rst,
        Seconds_units => Seconds_units,
        Seconds_tens => Seconds_tens,
        Minutes_units   => Minutes_units,
        Minutes_tens => Minutes_tens);
 
    -- Process for generating the clock
    clk <= not clk after ClockPeriod / 2;
 
    -- Testbench sequence
    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);
 
        -- Take the DUT out of reset
        rst <= '0';
        
        
 
        wait;
    end process;
 
end architecture;
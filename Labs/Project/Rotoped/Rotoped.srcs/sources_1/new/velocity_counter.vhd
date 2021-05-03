
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Velocity_counter is
    generic(
        g_CNT_WIDTH : natural := 4      -- Number of bits for counter         
           );
    Port ( 
            gen        : in std_logic;
            clk        : in std_logic;
            reset      : in  std_logic;       -- Synchronous reset                       
            cnt_o_A    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0);
            cnt_o_B    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0);
            
            
           -- ticks      : out std_logic_vector(g_CNT_WIDTH - 1 downto 0)
            ticks      : out real
            );
end Velocity_counter;

architecture Behavioral of Velocity_counter is  
 -- Local counter    
    signal s_cnt_local_A : unsigned(g_CNT_WIDTH - 1 downto 0);
    signal s_cnt_local_B : unsigned(g_CNT_WIDTH - 1 downto 0);
         
    signal s_ticks       : real;
    signal counter       : real;
    constant kmh         : real:= 3.6;
    signal convert       : unsigned(8-1 downto 0);
    
begin

    

p_vel : process(clk,gen)
    begin
        
        if reset = '1' then
               s_ticks <= 0.0;
               counter <= 0.0;
        elsif rising_edge(gen) then                                     
               counter <= counter + 2.0;   -- counting up
        elsif rising_edge(clk) then           
               s_ticks <= counter * kmh ; 
               counter <= 0.0; 
               convert <= TO_UNSIGNED(integer(s_ticks),8);                                                                
        end if;        
    end process p_vel;
    cnt_o_B <= std_logic_vector(TO_UNSIGNED(TO_INTEGER(convert mod 10),4));
    cnt_o_A <= std_logic_vector(TO_UNSIGNED(TO_INTEGER(convert/10),4));
    
    ticks <= s_ticks;
  
end Behavioral;


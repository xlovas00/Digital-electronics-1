
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_tread_sensor is
--  Port ( );
end tb_tread_sensor;

architecture Behavioral of tb_tread_sensor is
    
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    
    signal s_clk_100MHz : std_logic;
    signal s_rst        : std_logic;
    signal s_btn        : std_logic;
    signal s_trd        : std_logic;
    signal s_trd_led    : std_logic_vector(3-1 downto 0);
    
    
   
begin
    uut_tread_sensor : entity work.tread_sensor
        port map(
            clk => s_clk_100MHz,
            rst => s_rst,
      
            btn_o  => s_btn,
             
            trd_o  => s_trd,
            trd_led => s_trd_led
   
        );
    p_clk_gen : process
    begin
        while now < 1000000 ns loop   -- 10 usec of simulation
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
        -- Reset activated
        s_rst <= '1'; 
        wait for 50 ns;
        -- Reset deactivated
        s_rst <= '0';
        wait;
    end process p_reset_gen;

    p_stimulus : process
    begin
        -- No input data needed.
        report "Stimulus process started" severity note;
           
           s_btn <= '0';
           wait for 60ns; 
           s_btn <= '1';
           wait for 20ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 20ns;
           
           
           s_btn <= '0';
           wait for 100ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 100ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns; 
           
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
           
           
           
          
           s_btn <= '0';
           wait for 60ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
           
           
           s_btn <= '0';
           wait for 100ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 100ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns; 
           
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
           s_btn <= '0';
           wait for 50ns; 
           s_btn <= '1';
           wait for 10ns;
            
        report "Stimulus process ended" severity note;
        wait;
    end process p_stimulus;
end Behavioral;

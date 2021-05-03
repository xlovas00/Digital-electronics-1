library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is
    constant c_CLK_100MHZ_PERIOD : time    := 600000ms;
    
    signal s_CLK100MHZ : std_logic;
    signal s_BTN       : std_logic_vector(2-1 downto 0);  
    signal s_SW        : std_logic_vector(3-1 downto 0);
    signal s_JA        : std_logic_vector(7-1 downto 0);
    signal s_JB        : std_logic_vector(7-1 downto 0);
    signal s_JC        : std_logic_vector(7-1 downto 0);
    signal s_JD        : std_logic_vector(7-1 downto 0);
    signal s_LED0      : std_logic_vector(3-1 downto 0);
    
    
  
    
begin
    uut_top : entity work.top
        port map(
            CLK100MHZ => s_CLK100MHZ,
            BTN       => s_BTN      ,
            SW        => s_SW       ,
            JA        => s_JA       ,
            JB        => s_JB       ,
            JC        => s_JC       ,
            JD        => s_JD       ,
            LED0      => s_LED0     
            
            
            
                       
                );
    p_clk_gen : process
    begin
        while now < 600000ms loop         -- 75 periods of 100MHz clock
            s_CLK100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_CLK100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
               
        -- Reset activated
        s_BTN(1) <= '1';
        wait for 53 ns;
       
        s_BTN(1) <= '0';
        wait;
    end process p_reset_gen;

    p_stimulus : process
    begin

        report "Stimulus process started" severity note;
            s_SW(0) <= '0';
            s_SW(1) <= '0';
            s_SW(2) <= '0';
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            
            
            s_SW(0) <= '1';
             s_SW(1) <= '1';
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
             s_SW(1) <= '0';
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            s_BTN(0) <= '1';
            wait for 10ns;
            s_BTN(0) <= '0';
            wait for 500ns;
            
             s_SW(1) <= '1';
            
        

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end Behavioral;

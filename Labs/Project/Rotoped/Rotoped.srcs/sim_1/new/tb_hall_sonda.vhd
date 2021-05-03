library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_hall_sonda is
--  Port ( );
end tb_hall_sonda;

architecture Behavioral of tb_hall_sonda is
    constant c_MAX               : natural := 4;
    constant c_CLK_100MHZ_PERIOD : time    := 100 ns;
    
    --Local signals
    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_drl         : std_logic;
    signal s_gen         : std_logic;
    signal s_trdhs      : std_logic;
    
begin
    uut_ce : entity work.hall_sonda
        generic map(
            g_MAX => c_MAX
        )   -- Note that there is NO comma or semicolon between
            -- generic map section and port map section
        port map(
            clk   => s_clk_100MHz,
            rst => s_reset,
            drl_o => s_drl,
            gen_o => s_gen,
            trdhs => s_trdhs
            
        );

    p_clk_gen : process
    begin
        while now < 20000 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;

    p_reset_gen : process
    begin
                
        -- Reset activated
        s_reset <= '1';
        wait for 50 ns;

        -- Reset deactivated
        s_reset <= '0';

        wait;
    end process p_reset_gen;

    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_drl <= '1';
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        
        
        
        
        
        s_drl <= '0';
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        
        s_drl <= '1';
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
        s_trdhs <= '1';
        wait for 10 ns;
        s_trdhs <= '0';
        wait for 100 ns;
       
        
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;

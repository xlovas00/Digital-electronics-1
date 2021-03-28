library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is
     signal s_en     :std_logic;     
     signal s_arst   :std_logic;    
     signal s_d      :std_logic;       
     signal s_q      :std_logic;       
     signal s_q_bar  :std_logic;
       
begin

    uut_d_latch : entity work.d_latch
    port map (
      en    => s_en,
      arst  => s_arst,
      d     => s_d,
      q     => s_q,
      q_bar => s_q_bar
    );
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen :   process
    begin
        s_arst <=  '0';
        wait for 45 ns;
        s_arst <=  '1';
        wait for 5 ns;
        s_arst <=  '0';
        wait for 5 ns;
        s_arst <=  '1';
        wait for 5 ns;
        s_arst <=  '0';
        wait for 5 ns;
        s_arst <=   '1';
        wait for 5 ns;
        s_arst <=  '0';
        wait for 5 ns;
        s_arst <=  '1';
        wait for 5 ns;
        s_arst <= '0';
        
        wait;
    end process p_reset_gen;
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        s_en    <= '0';
        s_d     <= '0';
        wait for 10 ns;
        s_en    <= '0';
        s_d     <= '1';
        wait for 10 ns;
        s_en    <= '1';
        s_d     <= '0';
        wait for 10 ns;
        s_en    <= '1';
        s_d     <= '1';
        
        assert(s_q =  '1' and s_q_bar = '0')
        report "First assert s_q = 1, s_q_bar = 0" severity error;
        
        wait for 10 ns;
        s_en    <= '0';
        s_d     <= '0';
        wait for 10 ns;
        s_en    <= '0';
        s_d     <= '1';
        wait for 10 ns;
        s_en    <= '1';
        s_d     <= '0';
        
        assert(s_q =  '1' and s_q_bar = '0')
        report "Second assert s_q = 1, s_q_bar = 0" severity error;
        
        wait for 10 ns;
        s_en    <= '1';
        s_d     <= '1';
        wait for 10 ns;
        
        s_en    <= '0';
        s_d     <= '0';
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;

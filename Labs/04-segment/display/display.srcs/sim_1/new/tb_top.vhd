library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
--  Port ( );
end tb_top;

architecture Behavioral of tb_top is

    signal s_sw       : std_logic_vector(4 - 1 downto 0);
    signal s_ca       : std_logic;
    signal s_cb       : std_logic;
    signal s_cc       : std_logic;
    signal s_cd       : std_logic;
    signal s_ce       : std_logic;
    signal s_cf       : std_logic;
    signal s_cg       : std_logic;
    
    signal s_led      : std_logic_vector(8 - 1 downto 0);
    signal s_an       : std_logic_vector(8 - 1 downto 0);
    
begin
-- Connecting testbench signals with top entity (Unit Under Test)
    uut_top : entity work.top
        port map(
            SW           => s_sw,
            CA           => s_ca,
            CB           => s_cb,
            CC           => s_cc,
            CD           => s_cd,
            CE           => s_ce,
            CF           => s_cf,
            CG           => s_cg,
            
            LED          => s_led,
            AN          => s_an
        );
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_sw <= "0000"; wait for 100 ns;       -- 0
        
        s_sw <= "0001"; wait for 100 ns;       -- 1
        
        s_sw <= "0010"; wait for 100 ns;       -- 2
        
        s_sw <= "0011"; wait for 100 ns;       -- 3
        
        s_sw <= "0100"; wait for 100 ns;       -- 4
        
        s_sw <= "0101"; wait for 100 ns;       -- 5
        
        s_sw <= "0110"; wait for 100 ns;       -- 6
        
        s_sw <= "0111"; wait for 100 ns;       -- 7
        
        s_sw <= "1000"; wait for 100 ns;       -- 8
        
        s_sw <= "1001"; wait for 100 ns;       -- 9
        
        s_sw <= "1010"; wait for 100 ns;       -- A
        
        s_sw <= "1011"; wait for 100 ns;       -- B
        
        s_sw <= "1100"; wait for 100 ns;       -- C
        
        s_sw <= "1101"; wait for 100 ns;       -- D
        
        s_sw <= "1110"; wait for 100 ns;       -- E
        
        s_sw <= "1111"; wait for 100 ns;       -- F
           
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end Behavioral;

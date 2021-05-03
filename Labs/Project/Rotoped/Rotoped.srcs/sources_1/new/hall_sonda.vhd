library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hall_sonda is
    generic(
        g_MAX : natural := 4    
    );
    
    Port ( 
        clk   : in std_logic;
        rst   : in std_logic;
        trdhs : in std_logic;       -- input from tread sensor
        drl_o : in std_logic;       -- hardest or easiest 
        gen_o : out std_logic       -- generate pulse
    );
end hall_sonda;

architecture Behavioral of hall_sonda is
    
    signal s_cnt_local : natural;       -- local counter

begin
    p_hall_sonda : process(trdhs)
    begin
        if rising_edge(trdhs) then       -- set 
            if (rst = '1') then          -- High active reset
                s_cnt_local  <= 0;       -- Clear local counter
                gen_o        <= '0';
            -- easy level for treading
            elsif (drl_o = '0') then
                if (s_cnt_local >= (g_MAX - 1)) then
                    
                    s_cnt_local  <= 0;       -- Clear local counter
                    gen_o        <= '1';     -- Generate pulse

                else
                    s_cnt_local <= s_cnt_local + 1; -- counter +1
                    gen_o        <= '0';            -- generate 0
                end if;
            -- hard level for treading   
            elsif (drl_o = '1') then
                if (s_cnt_local >= ((g_MAX - 1)/2)) then
                    
                    s_cnt_local  <= 0;       -- Clear local counter
                    gen_o        <= '1';     -- Generate pulse

                else
                    s_cnt_local <= s_cnt_local + 1; -- counter +1
                    gen_o        <= '0';            -- generate 0
                end if;
            end if;
         end if;
    end process p_hall_sonda;
    
end Behavioral;

# VHDL
```vhdl
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter_distance is
    generic(
        g_CNT_WIDTH : natural := 4      -- Number of bits for counter
    );
    port(
        clk      : in  std_logic;       -- Clock from Hall probe
        reset    : in  std_logic;       -- Synchronous reset
        cnt_o_A    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0);    -- Output data display A
        cnt_o_B    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0);    -- Output data display B
        cnt_o_C    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0);    -- Output data display C
        cnt_o_D    : out std_logic_vector(g_CNT_WIDTH - 1 downto 0)     -- Output data display D
    );
end entity counter_distance;

architecture behavioral of counter_distance is

    -- Siganls for local counter
    signal s_cnt_local_A : unsigned(g_CNT_WIDTH - 1 downto 0);
    signal s_cnt_local_B : unsigned(g_CNT_WIDTH - 1 downto 0);
    signal s_cnt_local_C : unsigned(g_CNT_WIDTH - 1 downto 0);
    signal s_cnt_local_D : unsigned(g_CNT_WIDTH - 1 downto 0);

begin

    p_counter_distance : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then               -- Synchronous reset
                -- Clear all bits
                s_cnt_local_A <= (others => '0');
                s_cnt_local_B <= (others => '0');
                s_cnt_local_C <= (others => '0');
                s_cnt_local_D <= (others => '0');

            else
                if ( s_cnt_local_A = "1000" and s_cnt_local_B = "1001" and s_cnt_local_C = "1001" and s_cnt_local_D = "1001") then
                    --Clear all bits when value is 9998
                    s_cnt_local_A <= (others => '0');
                    s_cnt_local_B <= (others => '0');
                    s_cnt_local_C <= (others => '0');
                    s_cnt_local_D <= (others => '0');
                else
                    if (s_cnt_local_A = "1000") then                        -- display A = 9 -> reset display A
                        s_cnt_local_A <= "0000";
                        if (s_cnt_local_B = "1001") then                    -- display B = 9 -> reset display B
                            s_cnt_local_B <= "0000";
                            if (s_cnt_local_C = "1001") then                -- display B = 9 -> reset display C
                                s_cnt_local_C <= "0000";
                                if (s_cnt_local_D = "1001") then            -- display B = 9 -> reset display D
                                    s_cnt_local_D <= "0000";
                                else
                                    s_cnt_local_D <= s_cnt_local_D + 1;     -- data(display D) + 1
                                end if;
                            else
                                s_cnt_local_C <= s_cnt_local_C + 1;         -- data(display C) + 1
                            end if;
                        else
                            s_cnt_local_B <= s_cnt_local_B + 1;             -- data(display B) + 1
                        end if;
                    else
                        s_cnt_local_A <= s_cnt_local_A + 2;                 -- data(display A) + 1
                    end if;
                end if;
            end if;
        end if;
    end process p_counter_distance;

    -- Output must be retyped from "unsigned" to "std_logic_vector"
    cnt_o_A <= std_logic_vector(s_cnt_local_A);
    cnt_o_B <= std_logic_vector(s_cnt_local_B);
    cnt_o_C <= std_logic_vector(s_cnt_local_C);
    cnt_o_D <= std_logic_vector(s_cnt_local_D);

end architecture behavioral;
```
# Simulation
<img src="https://github.com/xlovas00/Digital-electronics-1/blob/main/Labs/counter-project/Images/counter_distance.png">

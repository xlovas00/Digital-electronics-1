library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_cnt_project is
-- Entity of testbench is always empty
end entity tb_cnt_project;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_cnt_project is

-- Number of bits for testbench counter
constant c_CNT_WIDTH : natural := 4;
constant c_CLK_100MHZ_PERIOD : time := 100 ns;
constant c_gen_o_PERIOD : time := 25 ns;

--Local signals
signal s_clk_100MHz : std_logic;
signal s_reset : std_logic;
signal s_cnt_A : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
signal s_cnt_B : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
signal s_cnt_C : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
signal s_cnt_D : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
signal s_gen_o : std_logic;
--signal s_ticks : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
signal s_ticks : real;

begin
-- Connecting testbench signals with cnt_project entity
-- (Unit Under Test)
uut_cnt : entity work.velocity_counter
generic map(
g_CNT_WIDTH => c_CNT_WIDTH
)
port map(
clk => s_clk_100MHz,
reset => s_reset,
gen_o => s_gen_o,
cnt_o_A => s_cnt_A,
cnt_o_B => s_cnt_B,
cnt_o_C => s_cnt_C,
cnt_o_D => s_cnt_D,
ticks   => s_ticks
);

--------------------------------------------------------------------
-- Clock generation process
--------------------------------------------------------------------
p_clk_gen : process
begin
while now < 100200 ns loop -- 100 200 periods of 100MHz clock
s_clk_100MHz <= '0';
wait for c_CLK_100MHZ_PERIOD / 2;
s_clk_100MHz <= '1';
wait for c_CLK_100MHZ_PERIOD / 2;
end loop;
wait;
end process p_clk_gen;

--------------------------------------------------------------------
-- Hallova sonda generation process
--------------------------------------------------------------------
p_hall_gen : process
begin
while now < 100200 ns loop 
s_gen_o <= '0';
wait for c_gen_o_PERIOD / 2 ;
s_gen_o <= '1';
wait for c_gen_o_PERIOD / 2;
end loop;
wait;
end process p_hall_gen;
--------------------------------------------------------------------
-- Reset generation process
--------------------------------------------------------------------
p_reset_gen : process
begin
s_reset <= '0';
wait for 10 ns;

-- Reset activated
s_reset <= '1';
wait for 10 ns;

s_reset <= '0';
wait;
end process p_reset_gen;

--------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
p_stimulus : process
begin
report "Stimulus process started" severity note;

report "Stimulus process finished" severity note;
wait;
end process p_stimulus;

end architecture testbench;
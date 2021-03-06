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
    constant c_CNT_WIDTH         : natural := 4;
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk : std_logic;
    signal s_reset      : std_logic;
    signal s_cnt_A        : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
    signal s_cnt_B        : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
    signal s_cnt_C        : std_logic_vector(c_CNT_WIDTH - 1 downto 0);
    signal s_cnt_D        : std_logic_vector(c_CNT_WIDTH - 1 downto 0);

begin
    -- Connecting testbench signals with cnt_project entity
    -- (Unit Under Test)
    uut_cnt : entity work.cnt_project
        generic map(
            g_CNT_WIDTH  => c_CNT_WIDTH
        )
        port map(
            clk      => s_clk,
            reset    => s_reset,
            cnt_o_A    => s_cnt_A,
            cnt_o_B    => s_cnt_B,
            cnt_o_C    => s_cnt_C,
            cnt_o_D    => s_cnt_D
        );

    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 100200 ns loop         -- 100 200 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

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

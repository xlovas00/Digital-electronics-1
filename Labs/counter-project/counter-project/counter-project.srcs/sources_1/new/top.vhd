library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port 
    ( 
        CLK100MHZ        : in STD_LOGIC;
        BTN              : in STD_LOGIC;
        CAA              : out STD_LOGIC;
        CAB              : out STD_LOGIC;
        CAC              : out STD_LOGIC;
        CAD              : out STD_LOGIC;
        CAE              : out STD_LOGIC;
        CAF              : out STD_LOGIC;
        CAG              : out STD_LOGIC;
        CBA              : out STD_LOGIC;
        CBB              : out STD_LOGIC;
        CBC              : out STD_LOGIC;
        CBD              : out STD_LOGIC;
        CBE              : out STD_LOGIC;
        CBF              : out STD_LOGIC;
        CBG              : out STD_LOGIC;
        CCA              : out STD_LOGIC;
        CCB              : out STD_LOGIC;
        CCC              : out STD_LOGIC;
        CCD              : out STD_LOGIC;
        CCE              : out STD_LOGIC;
        CCF              : out STD_LOGIC;
        CCG              : out STD_LOGIC;
        CDA              : out STD_LOGIC;
        CDB              : out STD_LOGIC;
        CDC              : out STD_LOGIC;
        CDD              : out STD_LOGIC;
        CDE              : out STD_LOGIC;
        CDF              : out STD_LOGIC;
        CDG              : out STD_LOGIC;
        AN               : out STD_LOGIC_VECTOR (4-1 downto 0)
        );
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is


    signal s_en  : std_logic;

    signal s_cnt_A : std_logic_vector(4 - 1 downto 0);
    signal s_cnt_B : std_logic_vector(4 - 1 downto 0);
    signal s_cnt_C : std_logic_vector(4 - 1 downto 0);
    signal s_cnt_D : std_logic_vector(4 - 1 downto 0);

begin

    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX       => 1000000
        )
        port map(
            clk         => CLK100MHZ,
            reset       => BTN,
            ce_o        => s_en   
        );

    bin_cnt0 : entity work.cnt_project
        generic map(
            g_CNT_WIDTH => 4
        )
        port map(
            clk         => CLK100MHZ,    
            reset       => BTN,
            en_i        => s_en,
            cnt_o_A     => s_cnt_A,
            cnt_o_B     => s_cnt_B,
            cnt_o_C     => s_cnt_C,
            cnt_o_D     => s_cnt_D
        );

    hex2segA : entity work.hex_7seg_A
        port map(
            hex_i_A    => s_cnt_A,
            seg_o_A(6) => CAA,
            seg_o_A(5) => CAB,
            seg_o_A(4) => CAC,
            seg_o_A(3) => CAD,
            seg_o_A(2) => CAE,
            seg_o_A(1) => CAF,
            seg_o_A(0) => CAG
        );
        
    hex2segB : entity work.hex_7seg_B
        port map(
            hex_i_B    => s_cnt_B,
            seg_o_B(6) => CBA,
            seg_o_B(5) => CBB,
            seg_o_B(4) => CBC,
            seg_o_B(3) => CBD,
            seg_o_B(2) => CBE,
            seg_o_B(1) => CBF,
            seg_o_B(0) => CBG
        );
        
    hex2segC : entity work.hex_7seg_C
        port map(
            hex_i_C    => s_cnt_C,
            seg_o_C(6) => CCA,
            seg_o_C(5) => CCB,
            seg_o_C(4) => CCC,
            seg_o_C(3) => CCD,
            seg_o_C(2) => CCE,
            seg_o_C(1) => CCF,
            seg_o_C(0) => CCG
        );
        
    hex2segD : entity work.hex_7seg_D
        port map(
            hex_i_D    => s_cnt_D,
            seg_o_D(6) => CDA,
            seg_o_D(5) => CDB,
            seg_o_D(4) => CDC,
            seg_o_D(3) => CDD,
            seg_o_D(2) => CDE,
            seg_o_D(1) => CDF,
            seg_o_D(0) => CDG
        );

    AN <= b"0000";

end architecture Behavioral;

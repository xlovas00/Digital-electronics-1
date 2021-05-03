library ieee;
use ieee.std_logic_1164.all;

entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time    := 10 ns;

    --Local signals
    signal s_clk_100MHz     : std_logic;
    --- WRITE YOUR CODE HERE
    signal s_reset          : std_logic;
   
    signal s_sw_timer       : std_logic;
    signal s_sw_distance    : std_logic;
    
    signal s_data_timer0    : std_logic_vector(4-1 downto 0);
    signal s_data_timer1    : std_logic_vector(4-1 downto 0);
    signal s_data_timer2    : std_logic_vector(4-1 downto 0);
    signal s_data_timer3    : std_logic_vector(4-1 downto 0);
    
    signal s_data_speed0    : std_logic_vector(4-1 downto 0);
    signal s_data_speed1    : std_logic_vector(4-1 downto 0);
    signal s_data_speed2    : std_logic_vector(4-1 downto 0);
    signal s_data_speed3    : std_logic_vector(4-1 downto 0);
    
    signal s_data_distance0 : std_logic_vector(4-1 downto 0);
    signal s_data_distance1 : std_logic_vector(4-1 downto 0);
    signal s_data_distance2 : std_logic_vector(4-1 downto 0);
    signal s_data_distance3 : std_logic_vector(4-1 downto 0);
    
    signal s_seg_ja            : std_logic_vector(7-1 downto 0);
    signal s_seg_jb            : std_logic_vector(7-1 downto 0);
    signal s_seg_jc            : std_logic_vector(7-1 downto 0);
    signal s_seg_jd            : std_logic_vector(7-1 downto 0);
    
    

begin
    -- Connecting testbench signals with driver_7seg_4digits entity
    -- (Unit Under Test)
    --- WRITE YOUR CODE HERE
    uut_driver_7seg_4digits : entity work.driver_7seg_4digits
    port map(
            clk => s_clk_100MHz,
            reset => s_reset,
                      
            sw_timer         => s_sw_timer,   
            sw_distance      => s_sw_distance,
                             
            data_timer0_i    => s_data_timer0,
            data_timer1_i    => s_data_timer1,
            data_timer2_i    => s_data_timer2,
            data_timer3_i    => s_data_timer3,
                            
            data_speed0_i    => s_data_speed0,  
            data_speed1_i    => s_data_speed1,   
            data_speed2_i    => s_data_speed2,   
            data_speed3_i    => s_data_speed3,   
                                            
            data_distance0_i => s_data_distance0,
            data_distance1_i => s_data_distance1,
            data_distance2_i => s_data_distance2,
            data_distance3_i => s_data_distance3,
                        
            seg_ja => s_seg_ja,
            seg_jb => s_seg_jb,        
            seg_jc => s_seg_jc,
            seg_jd => s_seg_jd 
            
        );
    --------------------------------------------------------------------
    -- Clock generation process
    --------------------------------------------------------------------
    p_clk_gen : process
    begin
        while now < 5000 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    --- WRITE YOUR CODE HERE
    
    p_reset_gen : process
    begin
              
        -- Reset activated
        s_reset <= '1';
        wait for 40 ns;
       
        s_reset <= '0';
        wait;
    end process p_reset_gen;

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    --- WRITE YOUR CODE HERE
    p_stimulus : process
    begin
        report "Stimulus process started" severity note;
        
        s_data_timer3 <= "0011";
        s_data_timer2 <= "0001";
        s_data_timer1 <= "0100";
        s_data_timer0 <= "0010";
       
        s_data_speed3 <= "0111";
        s_data_speed2 <= "0110";
        s_data_speed1 <= "0001";
        s_data_speed0 <= "0100";
        
        s_data_distance3 <= "0111";
        s_data_distance2 <= "0100";
        s_data_distance1 <= "0010";
        s_data_distance0 <= "0010";
               
        
        s_sw_timer <= '1';
        s_sw_distance <= '0';
        wait for 1000ns;
        
        s_sw_timer <= '0';
        s_sw_distance <= '0';
        wait for 1000ns;
        
        s_sw_timer <= '0';
        s_sw_distance <= '1';
        wait for 1000ns;
        
        s_sw_timer <= '1';
        s_sw_distance <= '1';
        wait for 1000ns;
        
       report "Stimulus process finished" severity note;  
       wait;
      end process p_stimulus; 
        

end architecture testbench;

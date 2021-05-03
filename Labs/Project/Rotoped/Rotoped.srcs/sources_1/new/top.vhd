library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top is
    Port ( 
        CLK100MHZ : in  STD_LOGIC;
        BTN       : in  STD_LOGIC_vector(2-1 downto 0);
        SW        : in  std_logic_vector(3-1 downto 0);
        JA        : out std_logic_vector(7-1 downto 0);
        JB        : out std_logic_vector(7-1 downto 0);
        JC        : out std_logic_vector(7-1 downto 0);
        JD        : out std_logic_vector(7-1 downto 0);
        LED0      : out std_logic_vector(3-1 downto 0)

    );
end top;

architecture Behavioral of top is
    signal s_hall  : std_logic;
    signal s_trdhs : std_logic;
    signal s_drl   : std_logic;
    
    signal s_timer0    : std_logic_vector(4 - 1 downto 0);
    signal s_timer1    : std_logic_vector(4 - 1 downto 0);
    signal s_timer2    : std_logic_vector(4 - 1 downto 0);
    signal s_timer3    : std_logic_vector(4 - 1 downto 0);
                                                          
    signal s_speed0    : std_logic_vector(4 - 1 downto 0);
    signal s_speed1    : std_logic_vector(4 - 1 downto 0);
    signal s_speed2    : std_logic_vector(4 - 1 downto 0);
    signal s_speed3    : std_logic_vector(4 - 1 downto 0);
                                                          
    signal s_distance0 : std_logic_vector(4 - 1 downto 0);
    signal s_distance1 : std_logic_vector(4 - 1 downto 0);
    signal s_distance2 : std_logic_vector(4 - 1 downto 0);
    signal s_distance3 : std_logic_vector(4 - 1 downto 0);
begin
     
    trd_sensor : entity work.tread_sensor
    port map (
        clk     => CLK100MHZ,
        rst     => BTN(1),
        btn_o   => BTN(0),
        trd_led => LED0
    
    );
    
    hall_sensor : entity work.hall_sonda
    port map (
        clk   => CLK100MHZ,
        rst   => BTN(1),
        trdhs => s_trdhs,
        drl_o => SW(0)
        
    
    );
    
    timer : entity work.timer
    port map (
        clk            => CLK100MHZ, 
        rst            => BTN(1),    
        Seconds_units  => s_timer3,
        Seconds_tens   => s_timer2,
        Minutes_units  => s_timer1,
        Minutes_tens   => s_timer0
         
    );
    
    counter : entity work.counter_distance         
    port map(                     
        hall    => s_hall,     
        reset   => BTN(1),   
        cnt_o_A => s_distance3,
        cnt_o_B => s_distance2,
        cnt_o_C => s_distance1,
        cnt_o_D => s_distance0 
    );
    
    speed : entity work.Velocity_counter         
    port map(                     
        gen     => s_hall,
        clk     => CLK100MHZ,        
        reset   => BTN(1),      
        cnt_o_A => s_speed3,
        cnt_o_B => s_speed2  
    );                            
    
    driver : entity work.driver_7seg_4digits
    port map(
        clk              => CLK100MHZ,
        reset            => BTN(1),   
        sw_timer         => SW(1),
        sw_distance      => SW(2),
        
        data_timer3_i    => s_timer3,
        data_timer2_i    => s_timer2,
        data_timer1_i    => s_timer1,
        data_timer0_i    => s_timer0, 
                         
        data_speed3_i    => s_speed3,
        data_speed2_i    => s_speed2, 
        data_speed1_i    => s_speed1,
        data_speed0_i    => s_speed0,
                         
        data_distance3_i => s_distance3,
        data_distance2_i => s_distance2,
        data_distance1_i => s_distance1,
        data_distance0_i => s_distance0, 
                         
        seg_ja(0)           => JA(0),
        seg_ja(1)           => JA(1),
        seg_ja(2)           => JA(2),
        seg_ja(3)           => JA(3),
        seg_ja(4)           => JA(4),
        seg_ja(5)           => JA(5),
        seg_ja(6)           => JA(6),
                         
        seg_jb(0)           => JB(0),
        seg_jb(1)           => JB(1),
        seg_jb(2)           => JB(2),
        seg_jb(3)           => JB(3),
        seg_jb(4)           => JB(4),
        seg_jb(5)           => JB(5),
        seg_jb(6)           => JB(6),
                                    
        seg_jc(0)           => JC(0),
        seg_jc(1)           => JC(1),
        seg_jc(2)           => JC(2),
        seg_jc(3)           => JC(3),
        seg_jc(4)           => JC(4),
        seg_jc(5)           => JC(5),
        seg_jc(6)           => JC(6),
                                    
        seg_jd(0)           => JD(0),
        seg_jd(1)           => JD(1),
        seg_jd(2)           => JD(2),
        seg_jd(3)           => JD(3),
        seg_jd(4)           => JD(4),
        seg_jd(5)           => JD(5),
        seg_jd(6)           => JD(6)
                          
    );
   
    
end Behavioral;

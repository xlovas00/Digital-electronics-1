library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity driver_7seg_4digits is
    port(
        clk              : in std_logic;        -- Main clock
        reset            : in std_logic;        -- Synchronous reset
        sw_timer         : in std_logic;
        sw_distance      : in std_logic;
        -- 4-bit input values for individual digits
        data_timer0_i    : in  std_logic_vector(4 - 1 downto 0);    -- Timer
        data_timer1_i    : in  std_logic_vector(4 - 1 downto 0);
        data_timer2_i    : in  std_logic_vector(4 - 1 downto 0);
        data_timer3_i    : in  std_logic_vector(4 - 1 downto 0);
        
        data_speed0_i    : in  std_logic_vector(4 - 1 downto 0);    -- Speed
        data_speed1_i    : in  std_logic_vector(4 - 1 downto 0);
        data_speed2_i    : in  std_logic_vector(4 - 1 downto 0);
        data_speed3_i    : in  std_logic_vector(4 - 1 downto 0);
        
        data_distance0_i : in  std_logic_vector(4 - 1 downto 0);    -- Distance
        data_distance1_i : in  std_logic_vector(4 - 1 downto 0);
        data_distance2_i : in  std_logic_vector(4 - 1 downto 0);
        data_distance3_i : in  std_logic_vector(4 - 1 downto 0);
        -- Cathode values for individual segments
        seg_ja           : out std_logic_vector(7 - 1 downto 0);
        seg_jb           : out std_logic_vector(7 - 1 downto 0);
        seg_jc           : out std_logic_vector(7 - 1 downto 0);
        seg_jd           : out std_logic_vector(7 - 1 downto 0)
        
        
    );
end entity driver_7seg_4digits;

architecture Behavioral of driver_7seg_4digits is
   
    -- Internal clock enable
    signal s_en        : std_logic;
    -- Internal 2-bit counter for multiplexing 4 digits
    signal s_cnt       : std_logic_vector(2 - 1 downto 0);
    -- Internal 4-bit value for 7-segment decoder
    signal s_hex_ja      : std_logic_vector(4 - 1 downto 0);
    signal s_hex_jb       : std_logic_vector(4 - 1 downto 0);
    signal s_hex_jc       : std_logic_vector(4 - 1 downto 0);
    signal s_hex_jd       : std_logic_vector(4 - 1 downto 0);
    
    
begin
    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 4 ms
    clk_en0 : entity work.clock_enable
        generic map(
            
            g_MAX => 4
        )
        port map(
            
            clk => clk,
            reset => reset,
            ce_o => s_en
        );

    --------------------------------------------------------------------
    -- Instance (copy) of cnt_up_down entity performs a 2-bit down
    -- counter
    bin_cnt0 : entity work.cnt_up_down
        generic map(
            
            g_CNT_WIDTH => 2
        )
        port map(
            
            clk      => clk,
            reset    => reset,
            en_i     => s_en,
            cnt_up_i => '0',
            cnt_o    => s_cnt
        );

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity performs a 7-segment display
    -- decoder
    hex2seg_ja : entity work.hex_7seg_ja
        port map(
            hex_ja => s_hex_ja,
            seg_ja => seg_ja
            
        );
     
     hex2seg_jb : entity work.hex_7seg_jb
        port map(
            hex_jb => s_hex_jb,
            seg_jb => seg_jb
            
        );
        
     hex2seg_jc : entity work.hex_7seg_jc
        port map(
            hex_jc => s_hex_jc,
            seg_jc => seg_jc
            
        );
        
     hex2seg_jd : entity work.hex_7seg_jd
        port map(
            hex_jd => s_hex_jd,
            seg_jd => seg_jd
            
        );
    
    p_mux : process(s_cnt, data_timer0_i, data_timer1_i, data_timer2_i, data_timer3_i,data_speed0_i, data_speed1_i, data_speed2_i, data_speed3_i, data_distance0_i, data_distance1_i, data_distance2_i, data_distance3_i, sw_timer, sw_distance)
    begin
        
                
        case s_cnt is
               
            when "11" =>
                if (sw_timer = '1') and (sw_distance = '0') then        -- dysplay timer
                    s_hex_ja <= data_timer3_i;
                    
                elsif (sw_timer = '0') and (sw_distance = '1')then      -- dysplay istance
                    s_hex_ja <= data_distance3_i;
                    
                else                                                    -- dysplay speed
                    s_hex_ja <= data_speed3_i;
                       
                end if;

            when "10" =>
                if (sw_timer = '1') and (sw_distance = '0') then        -- dysplay timer   
                    s_hex_jb <= data_timer2_i;
                    
                elsif (sw_timer = '0') and (sw_distance = '1')then      -- dysplay istance 
                    s_hex_jb <= data_distance2_i;
                    
                else                                                    -- dysplay speed   
                    s_hex_jb <= data_speed2_i;
                        
                end if;
            
            when "01" =>
                if (sw_timer = '1') and (sw_distance = '0') then        -- dysplay timer   
                    s_hex_jc <= data_timer1_i;
                    
                elsif (sw_timer = '0') and (sw_distance = '1')then      -- dysplay distance 
                    s_hex_jc <= data_distance1_i;
                    
                else                                                    -- dysplay speed   
                    s_hex_jc <= data_speed1_i;
                        
                end if;

            when others =>
                if (sw_timer = '1') and (sw_distance = '0') then        -- dysplay timer   
                    s_hex_jd <= data_timer0_i;
                    
                elsif (sw_timer = '0') and (sw_distance = '1')then      -- dysplay istance 
                    s_hex_jd <= data_distance0_i;
                    
                else                                                    -- dysplay speed   
                    s_hex_jd <= data_speed0_i;
                       
                end if;
        end case;
    end process p_mux;

end architecture Behavioral;

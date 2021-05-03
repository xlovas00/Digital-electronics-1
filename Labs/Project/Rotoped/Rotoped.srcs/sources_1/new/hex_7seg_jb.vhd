library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_7seg_jb is
   Port ( 
        hex_jb : in STD_LOGIC_VECTOR (4-1 downto 0);
        seg_jb : out STD_LOGIC_VECTOR (7-1 downto 0)
         );
end hex_7seg_jb;

architecture Behavioral of hex_7seg_jb is

begin

    p_7seg_decoder : process(hex_jb)
    begin
        case hex_jb is
            when "0000" =>
                seg_jb <= "0000001";     -- 0
            
            when "0001" =>
                seg_jb <= "1001111";     -- 1
            
            when "0010" =>
                seg_jb <= "0010010";     -- 2
            
            when "0011" =>
                seg_jb <= "0000110";     -- 3
            
            when "0100" =>
                seg_jb <= "1001100";     -- 4
            
            when "0101" =>
                seg_jb <= "0100100";     -- 5
            
            when "0110" =>
                seg_jb <= "0100000";     -- 6
            
            when "0111" =>
                seg_jb <= "0001111";     -- 7
            
            when "1000" =>
                seg_jb <= "0000000";     -- 8
            
            when "1001" =>
                seg_jb <= "0000010";     -- 9
                                  
            when others =>
                seg_jb <= "1111110";     -- F
        end case;
    end process p_7seg_decoder;


end Behavioral;

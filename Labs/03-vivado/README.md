# 03-vivado
## Github link
[https://github.com/xlovas00/Digital-electronics-1](https://github.com/xlovas00/Digital-electronics-1)
## Table connection
| **Component** | **Resistor [Ω]** | **PIN** | 
| :-: | :-: | :-: |
| SW0 | 10K | J15 |
| SW1 |  |  |
| SW2 |  |  | 
| SW3 |  |  | 
| SW4 |  |  |
| SW5 |  |  | 
| SW6 |  |  | 
| SW7 |  |  | 
| SW8 |  |  | 
| SW9 |  |  | 
| SW10 |  |  | 
| SW11 |  |  | 
| SW12 |  |  | 
| SW13 |  |  | 
| SW14 |  |  | 
| SW15 |  |  | 
| LED0 |  |  |
| LED1 |  |  |
| LED2 |  |  | 
| LED3 |  |  | 
| LED4 |  |  |
| LED5 |  |  | 
| LED6 |  |  | 
| LED7 |  |  | 
| LED8 |  |  | 
| LED9 |  |  | 
| LED10 |  |  | 
| LED11 |  |  | 
| LED12 |  |  | 
| LED13 |  |  | 
| LED14 |  |  | 
| LED15 |  |  | 

## Two-bit wide 4-to-1 multiplexer
### VHDL achitecture
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin

    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;

end Behavioral;
```
```vhdl
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "11"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "10"; s_a <= "00"; 
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "00"; s_b <= "00"; s_a <= "00"; 
        s_sel <= "11"; wait for 100 ns;


        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; 
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "11"; s_c <= "10"; s_b <= "01"; s_a <= "00"; 
        s_sel <= "11"; wait for 100 ns;
        
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
### Time waveforms
<img src="https://github.com/xlovas00/Digital-electronics-1/blob/main/Labs/03-vivado/Images/mux2bit4to1waveform.png">

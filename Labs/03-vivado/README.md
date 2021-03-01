# 03-vivado
## Github link
[https://github.com/xlovas00/Digital-electronics-1](https://github.com/xlovas00/Digital-electronics-1)
## Table with connection of 16 slide switches and 16 LEDs
| **Component** | **Resistor [Ω]** | **PIN** | 
| :-: | :-: | :-: |
| SW0 | 10K | J15 |
| SW1 | 10K | L16 |
| SW2 | 10K | M13 | 
| SW3 | 10K | R15 | 
| SW4 | 10K | R17 |
| SW5 | 10K | T18 | 
| SW6 | 10K | U18 | 
| SW7 | 10K | R13 | 
| SW8 | 10K | T8 | 
| SW9 | 10K | U8 | 
| SW10 | 10K | R16 | 
| SW11 | 10K | T13 | 
| SW12 | 10K | H6 | 
| SW13 | 10K | U12 | 
| SW14 | 10K | U11 | 
| SW15 | 10K | V10 | 
| LED0 (active-high) | 330 | H17 |
| LED1 (active-high) | 330 | K15 |
| LED2 (active-high) | 330 | J13 | 
| LED3 (active-high) | 330 | N14 | 
| LED4 (active-high) | 330 | R18 |
| LED5 (active-high) | 330 | V17 | 
| LED6 (active-high) | 330 | U17 | 
| LED7 (active-high) | 330 | U16 | 
| LED8 (active-high) | 330 | V16 | 
| LED9 (active-high) | 330 | T15 | 
| LED10 (active-high) | 330 | U14 | 
| LED11 (active-high) | 330 | T16 | 
| LED12 (active-high) | 330 | V15 | 
| LED13 (active-high) | 330 | V14 | 
| LED14 (active-high) | 330 | V12 | 
| LED15 (active-high) | 330 | V11 | 

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
### VHDL stimulus process
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

## Vivado tutorial
1. **How to create a project**
   - File --> Project --> New... --> Next
   - Choose project name and location --> Next
   - **RTL Project** --> Next
   - Add/create source or skip --> Next
   - Default part
   - Choose from **Boards** Nexys A7-50T --> Next
   - Finish
2. **How to add source file**
   - File --> Add Sources...
   - Add or create design sources
   - Add/create file
   - File type **VHDL**
   - Finish
3. **How to add testbench file**
   - File --> Add Sources...
   - Add or create simulation sources
   - Add/create file
   - File type **VHDL**
   - Finish
4. **Simulation**
   - Flow --> Run Simulation --> Run Behavioral Simulation
   - **Zoom Fit** for better view 
   - Right click on output/input for Signal color or Radix
5. **How to add XDC constraints file**
   - File --> Add Sources...
   - Add or create constraints
   - Add/create file
   - File type **XDC**
   - Finish

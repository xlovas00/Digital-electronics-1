# 04-segment
## Github link
[https://github.com/xlovas00/Digital-electronics-1](https://github.com/xlovas00/Digital-electronics-1)

### Figure or table with connection of 7-segment displays on Nexys A7 board
| **Component** | **Resistor [Ω]** | **PIN** | 
| :-: | :-: | :-: |
| CA | 100 | T10 |
| CB | 100 | R10 |
| CC | 100 | K16 | 
| CD | 100 | K13 | 
| CE | 100 | P15 |
| CF | 100 | T11 | 
| CG | 100 | L18 | 
| DP | 100 | H15 | 
| AN0 | 2K2 | J17 | 
| AN1 | 2K2 | J18 | 
| AN2 | 2K2 | T9 | 
| AN3 | 2K2 | J14 | 
| AN4 | 2K2 | P14 | 
| AN5 | 2K2 | T14 | 
| AN6 | 2K2 | K2 | 
| AN7 | 2K2 | U13 | 

### Decoder truth table for common anode 7-segment display.
| **Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |

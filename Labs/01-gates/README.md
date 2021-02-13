# 01-gates

## EDA playground link

## VHDL kód
```vhdl
architecture dataflow of gates is
begin
    f_o  <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= ((not b_i) nand a_i) nand ((not c_i) nand (not b_i));
    fnor_o <= not((b_i nor (not a_i)) nor (c_i nor b_i));
    fboolean1_o <= x_i and (not x_i);
    fboolean2_o <= x_i or (not x_i);
    fboolean3_o <= x_i or x_i or x_i;
    fboolean4_o <= x_i and x_i and x_i;
    fdistributive1_o <= (x_i and y_i) or (x_i and z_i);
    fdistributive2_o <= x_i and (y_i or z_i);
    fdistributive3_o <= (x_i or y_i) and (x_i or z_i);
    fdistributive4_o <= x_i or (y_i and z_i);

end architecture dataflow;
```
### Tři funkce

#### Funkce

#### Tabulka hodnot
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

#### Časové průběhy

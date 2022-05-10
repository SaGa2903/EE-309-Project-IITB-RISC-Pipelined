library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

entity pc is
    port (
        clk: in std_logic;
        opcode2, opcode3, opcode4: in std_logic_vector(3 downto 0);  
        pc_inc_1, se_plus_pc_2,
        rf_d2_3, alu_or_eq_4: in std_logic_vector(15 downto 0);
        pc_out: out std_logic_vector(15 downto 0);
    );
end entity pc;

architecture arch of pc is
    begin
        r1: process(CLK)

        begin
            if opcode4 = "1011" then
                pc_out <= alu_or_eq_4;
            elsif opcode3 = "1010" then
                pc_out <= rf_d2_3;
            elsif opcode2 <= "1001" then
                pc_out <= se_plus_pc_2;
            else pc_out <= pc_inc_1;
            end if;
        end process;
    
    end architecture;

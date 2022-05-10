library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ins_f is
    port(
        EN, clk, reset: in std_logic;
        opcode2, opcode3, opcode4: in std_logic_vector(3 downto 0);  
        pc_inc_1, se_plus_pc_2,
        rf_d2_3, alu_or_eq_4: in std_logic_vector(15 downto 0);
        ir_out, pc_inc_out, pc_out: out std_logic_vector(15 downto 0);
    );
end entity;

architecture arch of ins_f is

    component code_mem is
        port(
            address_in: in std_logic_vector(15 downto 0);
            clk: in std_logic;
            d_out: out std_logic_vector(15 downto 0)
        );
    end component code_mem;

    component pc is
        port (
            clk: in std_logic;
            opcode2, opcode3, opcode4: in std_logic_vector(3 downto 0);  
            pc_inc_1, se_plus_pc_2,
            rf_d2_3, alu_or_eq_4: in std_logic_vector(15 downto 0);
            pc_out: out std_logic_vector(15 downto 0);
        );
    end component pc;

    component pc_inc is
        port(
            input: in std_logic_vector(15 downto 0);
            output : out std_logic_vector(15 downto 0)
        );
    end component;

    signal pc_out_sig: std_logic_vector(15 downto 0);

begin

    pc_block: pc
    port map(
        clk=> clk;
        opcode2 => opcode2;
        opcode3 => opcode3;
        opcode4 => opcode4;  
        pc_inc_1 => pc_inc_1;
        se_plus_pc_2 => se_plus_pc_2;
        rf_d2_3 => rf_d2_3;
        alu_or_eq_4 => alu_or_eq_4;
        pc_out => pc_out_sig
    );
    
    pc_inc_block: pc_inc
    port map(
        input => pc_out_sig,
        output => pc_inc_out
    );

    code_mem_block: code_mem
    port map(
        address_in=> pc_out_sig,
        clk=> clk,
        d_out => ir_out
    );

end architecture;


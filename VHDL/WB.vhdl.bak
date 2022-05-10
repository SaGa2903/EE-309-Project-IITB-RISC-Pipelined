library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity WB is
    port(
        EN, clk, reset: in std_logic;
        alu_or_eq_in, ls_in, pc_inc_in, mem_d_in: in std_logic_vector(15 downto 0);
        opcode: in std_logic_vector(3 downto 0);
        output: out std_logic_vector(15 downto 0);
    );
end entity;

architecture arch of WB is

    -- signal ir_sig: std_logic_vector(15 downto 0);
begin

    data_mem_block: data_mem

    port map(
        clk=> clk,
        mem_a => alu_or_eq_in,
        mem_din=> rf_d1,
        opcode => ir_sig(15 downto 12);
        d_out=> mem_d_out
    );
    
    r1: process(CLK, EN, reset)

    begin
        if(EN='1') then
            if opcode = "0001" or opcode = "0010" or opcode = "0000" then
                output <= alu_or_eq_in;
            elsif opcode = "0011" then
                output <= ls_in;
            elsif opcode = "0111" then
                output <= mem_d_out;
            elsif opcode= "1001" or opcode = "1010" then
                output <= pc_inc_in;
            end if ;
        end if;
    end process;
end architecture;


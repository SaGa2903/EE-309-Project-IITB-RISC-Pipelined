library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MEM is
    port(
        EN,alu_cy_in, alu_z_in,clk, reset: in std_logic;
        ir_in, alu_or_eq_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
        se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);

        ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
        se_plus_pc_out, pc_inc_out, mem_d_out: out std_logic_vector(15 downto 0);
        alu_cy_out, alu_z_out: out std_logic; 
    );
end entity;

architecture arch of MEM is

    component data_mem is
        port(
            mem_a, mem_din: in std_logic_vector(15 downto 0);
            clk: in std_logic;
            opcode: in std_logic_vector(3 downto 0);
            d_out: out std_logic_vector(15 downto 0)
        );
    end component data_mem;

    signal ir_sig: std_logic_vector(15 downto 0);
begin
    ir_sig <= ir_in;
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
        if reset='1' then
            pc_inc_out<= (others=>'0');
            ir_out <= (others => '0');
            ls_out <= (others => '0');
            se_out <= (others => '0');
            se_plus_pc_out <= (others => '0');
            rf_d1_out <= (others => '0');
            rf_d2_out <= (others => '0');
            alu_cy_out <= (others => '0');
            alu_z_out <= (others => '0');
            alu_or_eq_out<= (others => '0');

        elsif CLK'event and CLK='0' then
            if EN ='1' then
                pc_inc_out <= pc_inc_in;
                ir_out <= ir_in;
                ls_out <= ls_in;
                se_out <= se_in;
                se_plus_pc_out <= se_plus_pc_in,   
                rf_d1_out <= rf_d1_in;
                rf_d2_out <= rf_d2_in;
                alu_cy_out <= alu_cy_in;
                alu_z_out <= alu_z_in;
                alu_or_eq_out<= alu_or_eq_in;

            end if;
        end if ;
    end process;
end architecture;


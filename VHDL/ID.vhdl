library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity id is
    port(
        EN, clk, reset: in std_logic;
        ir_in, pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
        ir_out, se_out, se_plus_pc_out, ls_out, pc_inc_out: out std_logic_vector(15 downto 0)
    );
end entity;

architecture arch of id is

    component se_alu is
        port(
            input_1: in std_logic_vector(15 downto 0);
            input_2: in std_logic_vector(15 downto 0);
            output : out std_logic_vector(15 downto 0)
        );
    end component;

    component SE is
        port (
            
            opcode : in std_logic_vector(3 downto 0);
            input_1 : in std_logic_vector (5 downto 0);
            input_2 : in std_logic_vector (8 downto 0);
            output : out std_logic_vector (15 downto 0)
        );
    end component;

    component Shift7 is
        port (
            input : in std_logic_vector (8 downto 0);
            output : out std_logic_vector (15 downto 0)
        );
    end component;

    signal se_in_sig, se_out_sig, ir_sig: std_logic_vector(15 downto 0);

begin
    ir_sig<= ir_in;

    se_block: SE
    port map(
        opcode => ir_sig(15 downto 12),
        input_1 => ir_sig(5 downto 0),
        input_2 => ir_sig(8 downto 0),
        output => se_out_sig
    );
    
    se_alu_block: se_alu
    port map(
        input_1 => se_in_sig,
        input_2 => pc_in,
        output => se_plus_pc_out
    );

    ls_block: Shift7
    port map(
        input => ir_sig(8 downto 0),
        output=> ls_out
    );

    r1: process(CLK, EN, reset)

    begin
        if reset='1' then
            pc_inc_out<= (others=>'0');
            ir_out <= (others => '0');
        elsif CLK'event and CLK='0' then
            if EN ='1' then
                pc_inc_out <= pc_inc_in;
                ir_out <= ir_in;
            end if;
        end if ;
    end process;
end architecture;


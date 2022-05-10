library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rr is
    port(
        EN,clk, reset: in std_logic;
        ir_in, se_in, se_plus_pc_in, 
        ls_in, pc_inc_in, d3_in: in std_logic_vector(15 downto 0);
        ir_out, rf_d1_out, rf_d2_out, ls_out, se_out,
        se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
    );
end entity;

architecture arch of rr is

    component reg_file is
        port (
            CLK ,reset: in std_logic;
            ir, d3: in std_logic_vector(15 downto 0);
            d1, d2 : out std_logic_vector(15 downto 0);
          );
    end component reg_file;

    signal ir_sig, d3_in_sig: std_logic_vector(15 downto 0);

begin
    ir_sig<= ir_in;
    d3_in_sig <= d3_in;

    rf_block: reg_file
    port map(
        clk=> clk,
        reset=> reset,
        ir => ir_sig,
        d3 => d3_in_sig,
        d1 => rf_d1_out,
        d2 => rf_d2_out 
    );
    
    r1: process(CLK, EN, reset, ir_sig)

    begin
        -- if(EN='1') then
        --     if ir_sig(15 downto 12) = "0001" or ir_sig(15 downto 12) = "0010" then
        --         a3<= ir_sig(5 downto 3);
        --     elsif ir_sig(15 downto 12) = "0000" then
        --         a3<= ir_sig(8 downto 6);
        --     elsif ir_sig(15 downto 12) = "0111" or ir_sig(15 downto 12) = "1001"  
        --     or ir_sig(15 downto 12) = "1010" then
        --         a3<= ir_sig(11 downto 9);
        -- end if;

        if reset='1' then
            pc_inc_out<= (others=>'0');
            ir_out <= (others => '0');
            ls_out <= (others => '0');
            se_out <= (others => '0');
            se_plus_pc_out <= (others => '0');
        elsif CLK'event and CLK='0' then
            if EN ='1' then
                pc_inc_out <= pc_inc_in;
                ir_out <= ir_in;
                ls_out <= ls_in;
                se_out <= se_in;
                se_plus_pc_out <= se_plus_pc_in,

            end if;
        end if ;
    end process;
end architecture;


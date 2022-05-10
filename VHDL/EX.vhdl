library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ex is
    port(
        EN,clk, reset: in std_logic;
        ir_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
        se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
        ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
        se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
        alu_cy_out, alu_z_out: out std_logic;
    );
end entity;

architecture arch of ex is
    component alu is
        port(
            opcode: in std_logic_vector(3 downto 0);
            cz: in std_logic_vector(1 downto 0); -- last 2 bits of instruction
            input_1, input_2: in std_logic_vector(15 downto 0); --put a mux in input_2 for immediate data (from SE)
            output: out std_logic_vector(15 downto 0);
           
            CY: out std_logic; -- carry flag
            Z: out std_logic;   -- zero flag
            Cin,Zin,clk: in std_logic       
    
        );
    end component;

    component Shift1 is
        port (
            opcode : in std_logic_vector(3 downto 0);
            cz : in std_logic_vector(1 downto 0);
            input : in std_logic_vector (15 downto 0);
            output : out std_logic_vector (15 downto 0)
        );
    end component;

    component eq is
        port(
            eq1: in std_logic_vector(15 downto 0); -- rf_d1
            eq2: in std_logic_vector(15 downto 0);-- rf_d2
            eq3: in std_logic_vector(15 downto 0); -- pc_inc
            eq4: in std_logic_vector(15 downto 0);-- se+pc
            eq_out: out std_logic_vector(15 downto 0));   
    end component;

    signal alu_b_sig, ir_sig, shift1_out_sig, alu_out_sig, eq_out_sig : std_logic_vector(15 downto 0);
    signal cin_sig, zin_sig, cout_sig, zout_sig: std_logic := '0';
begin
    ir_sig <= ir_in

    r1: process(CLK,EN, reset)

    begin
        if ir_sig(15 downto 12) = "1011" then
            alu_b_sig <= se_in;
        else alu_b_sig <= shift1_out_sig;
        end if;


        if CLK'event and CLK='0' then   
            pc_inc_out <= pc_inc_in;
            ir_out <= ir_in;
            ls_out <= ls_in;
            se_out <= se_in;
            se_plus_pc_out <= se_plus_pc_in, 
            rf_d1_out <= rf_d1_in;
            rf_d2_out <= rf_d2_in;
            alu_cy_out <= cout_sig;
            alu_z_out <= zout_sig;

        if ir_sig(15 downto 12) = "1000" then
            alu_or_eq_out <= eq_out_sig;
        else alu_or_eq_out <= alu_out_sig;
        end if;

            if EN ='1' then
                cout_sig <= cin_sig;
                zout_sig <= zin_sig;
            end if;
        end if ;
    end process;

    shift1_block: Shift1
    port map(
        opcode => ir_sig(15 downto 12),
        cz => ir_sig(1 downto 0),
        input => rf_d2_in,
        output => shift1_out_sig
    );

    alu_block: alu
    port map(
        clk => clk,
        input_1 => rf_d1_in,
        input_2 => alu_b_sig,
        opcode => ir_sig(15 downto 12),
        cz => ir_sig(1 downto 0),
        Cin=> cin_sig,
        Zin=> zin_sig,
        CY => cout_sig,
        Z => zout_sig,
        output=> alu_out_sig
    );
    
    eq_block: eq
    port map(
        eq1 => rf_d1_in,
        eq2 => rf_d2_in,
        eq3 => pc_inc_in,
        eq4 => se_plus_pc_in,
        eq_out => eq_out_sig
    );


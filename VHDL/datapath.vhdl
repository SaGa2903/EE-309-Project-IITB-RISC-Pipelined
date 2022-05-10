library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.all;

entity datapath is
    port(
        state_id: in std_logic_vector(4 downto 0);
        state_cw: in std_logic_vector(34 downto 0);
        clk, reset: in std_logic;

        c, z, eq : out std_logic;  -- eq to be clarified
        opcode: out std_logic_vector(3 downto 0);
        cz : out std_logic_vector(1 downto 0)       -- cz is the condition bit from instruction

    );
end entity;

architecture arch of datapath is

    component ins_f is
        port(
            EN, clk, reset: in std_logic;
            opcode2, opcode3, opcode4: in std_logic_vector(3 downto 0);  
            pc_inc_1, se_plus_pc_2,
            rf_d2_3, alu_or_eq_4: in std_logic_vector(15 downto 0);
            ir_out, pc_inc_out, pc_out: out std_logic_vector(15 downto 0);
        );
    end component;

    component id is
        port(
            EN, clk, reset: in std_logic;
            ir_in, pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, se_out, se_plus_pc_out, ls_out, pc_inc_out: out std_logic_vector(15 downto 0)
        );
    end component;

    component rr is
        port(
            EN,clk, reset: in std_logic;
            ir_in, se_in, se_plus_pc_in, 
            ls_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, rf_d1_out, rf_d2_out, ls_out, se_out,
            se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
        );
    end component;

    component ex is
        port(
            EN,clk, reset: in std_logic;
            ir_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
            se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
            se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
            alu_cy_out, alu_z_out: out std_logic;
        );
    end component;

    component MEM is
        port(
            EN,alu_cy_in, alu_z_in,clk, reset: in std_logic;
            ir_in, alu_or_eq_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
            se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
    
            ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
            se_plus_pc_out, pc_inc_out, mem_d_out: out std_logic_vector(15 downto 0);
            alu_cy_out, alu_z_out: out std_logic; 
        );
    end component;

    component WB is
        port(
            EN, clk, reset: in std_logic;
            alu_or_eq_in, ls_in, pc_inc_in, mem_d_in: in std_logic_vector(15 downto 0);
            opcode: in std_logic_vector(3 downto 0);
            output: out std_logic_vector(15 downto 0);
        );
    end component;


    signal EN_sig_1,ir_in_sig_1, pc_in_sig_1, pc_inc_in_sig_1: std_logic_vector(15 downto 0);
    signal ir_out_sig_1, pc_out_sig_1, pc_inc_out_sig_1: std_logic_vector(15 downto 0);
    signal reset, clk: std_logic;

    signal EN_sig_2,alu_cy_in_sig_2, alu_z_in_sig_2: std_logic;
    signal ir_in_sig_2, alu_or_eq_in_sig_2, rf_d1_in_sig_2, rf_d2_in_sig_2, ls_in_sig_2, se_in_sig_2, 
    se_plus_pc_in_sig_2, pc_inc_in_sig_2: std_logic_vector(15 downto 0);
    signal ir_out_sig_2, alu_or_eq_out_sig_2, rf_d1_out_sig_2, rf_d2_out_sig_2, ls_out_sig_2, se_out_sig_2,
    se_plus_pc_out_sig_2, pc_inc_out_sig_2: std_logic_vector(15 downto 0);
    signal alu_cy_out_sig_2, alu_z_out_sig_2: std_logic;

    signal EN_sig_3: std_logic;
    signal ir_in_sig_3, rf_d1_in_sig_3, rf_d2_in_sig_3, ls_in_sig_3, se_in_sig_3, 
    se_plus_pc_in_sig_3, pc_inc_in_sig_3: std_logic_vector(15 downto 0);
    signal ir_out_sig_3, rf_d1_out_sig_3, rf_d2_out_sig_3, ls_out_sig_3, se_out_sig_3,
    se_plus_pc_out_sig_3, pc_inc_out_sig_3: std_logic_vector(15 downto 0); 

    signal EN_sig_4,alu_cy_in_sig_4, alu_z_in_sig_4: std_logic;
    signal ir_in_sig_4, alu_or_eq_in_sig_4, rf_d1_in_sig_4, rf_d2_in_sig_4, ls_in_sig_4, se_in_sig_4, 
    se_plus_pc_in_sig_4, pc_inc_in_sig_4: std_logic_vector(15 downto 0);
    signal ir_out_sig_4, alu_or_eq_out_sig_4, rf_d1_out_sig_4, rf_d2_out_sig_4, ls_out_sig_4, se_out_sig_4,
    se_plus_pc_out_sig_4, pc_inc_out_sig_4: std_logic_vector(15 downto 0);
    signal alu_cy_out_sig_4, alu_z_out_sig_4: std_logic;

    signal EN_sig_5,alu_cy_in_sig_5, alu_z_in_sig_5: std_logic;
    signal ir_in_sig_5, alu_or_eq_in_sig_5, rf_d1_in_sig_5, rf_d2_in_sig_5, ls_in_sig_5, se_in_sig_5, 
    se_plus_pc_in_sig_5, pc_inc_in_sig_5, mem_d_in_sig_5: std_logic_vector(15 downto 0);
    signal ir_out_sig_5, alu_or_eq_out_sig_5, rf_d1_out_sig_5, rf_d2_out_sig_5, ls_out_sig_5, se_out_sig_5,
    se_plus_pc_out_sig_5, pc_inc_out_sig_5, mem_d_out_sig_5: std_logic_vector(15 downto 0);
    signal alu_cy_out_sig_5, alu_z_out_sig_5: out std_logic;  


    begin
    
        inst_fetch: ins_f
        port map(
        EN=>EN_sig_1,
        clk=> clk,
        reset=> reset,
        opcode2=> ir_in_sig_2(15 downto 12), 
        opcode3 => ir_in_sig_3(15 downto 12),
        opcode4 => ir_in_sig_4(15 downto 12),  
        pc_inc_1 => pc_inc_out_sig_1, 
        se_plus_pc_2 => se_plus_pc_out_sig_2,
        rf_d2_3 => rf_d2_out_sig_3,
        alu_or_eq_4=> alu_or_eq_out_sig_4,
        ir_out => ir_in_sig_1, 
        pc_inc_out=> pc_inc_in_sig_1,
        pc_out=> pc_in_sig_1
        );

        pip1: pip_reg1
        port map(
            
        );

        ins_dec: id
        port map(

        );

        pip2: pip_reg2
        port map(
            
        );
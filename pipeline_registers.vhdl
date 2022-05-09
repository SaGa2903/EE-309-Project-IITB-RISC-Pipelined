library ieee;
use ieee.std_logic_1164.all;
library work;
use work.all;

-- 4 bit registers may also be required.
package pip_reg is
    component pip_reg1 is
        port(
            EN,clk, reset: in std_logic;
            ir_in, pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
        );
    end component;

    component pip_reg2 is
        port(
            EN,clk, reset: in std_logic;
            ir_in, se_in, se_plus_pc_in, 
            ls_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, se_out, se_plus_pc_out, 
            ls_out, pc_inc_out: out std_logic_vector(15 downto 0);
        );
    end component;

    component pip_reg3 is
        port(
            EN,clk, reset: in std_logic;
            ir_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
            se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, rf_d1_out, rf_d2_out, ls_out, se_out,
            se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0); 
        );
    end component;

    component pip_reg4 is
        port(
            EN,alu_cy_in, alu_z_in,clk, reset: in std_logic;
            ir_in, alu_or_eq_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
            se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
            ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
            se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
            alu_cy_out, alu_z_out: out std_logic;
        );
    end component;

    component pip_reg5 is
        port(
            EN,alu_cy_in, alu_z_in,clk, reset: in std_logic;
            ir_in, alu_or_eq_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
            se_plus_pc_in, pc_inc_in, mem_d_in: in std_logic_vector(15 downto 0);
            ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
            se_plus_pc_out, pc_inc_out, mem_d_out: out std_logic_vector(15 downto 0);
            alu_cy_out, alu_z_out: out std_logic;  
        );
    end component;

end package;

-- //////////////////////////////////////////////////////////////
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.misc.all;

entity pip_reg1 is
    port(
        EN,clk, reset: in std_logic;
        ir_in, pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
        ir_out, pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
    );
end entity;

architecture arch of pip_reg1 is
    signal enable: std_logic := '1';
    -- signal reset: std_logic := '0';

    enable <= EN;

    ir_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ir_in;
        output=> ir_out;
    );

    pc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>pc_in;
        output=> pc_out;
    );

    pc_inc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>pc_inc_in;
        output=> pc_inc_out;
    );
    
end architecture;

-- ////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.misc.all;

entity pip_reg2 is
    port(
        EN,clk, reset: in std_logic;
        ir_in, se_in, se_plus_pc_in, 
        ls_in, pc_inc_in: in std_logic_vector(15 downto 0);
        ir_out, se_out, se_plus_pc_out, 
        ls_out, pc_inc_out: out std_logic_vector(15 downto 0);
    );
end entity;

architecture arch of pip_reg2 is
    signal enable: std_logic := '1';
    -- signal reset: std_logic := '0';
    -- signal alu_cy_sig, alu_z_sig: std_logic;

    enable <= EN;
    -- alu_cy_sig <= alu_cy_in;

    ir_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ir_in;
        output=> ir_out;
    );

    pc_inc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>pc_inc_in;
        output=> pc_inc_out;
    );

    ls_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ls_in;
        output=> ls_out;
    );

    se_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_in;
        output=> se_out;
    );

    se_plus_pc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_plus_pc_in;
        output=> se_plus_pc_out;
    ); 

end architecture;

-- ////////////////////////////////////////////////////////////

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.misc.all;

entity pip_reg3 is
    port(
        EN,clk, reset: in std_logic;
        ir_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
        se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
        ir_out, rf_d1_out, rf_d2_out, ls_out, se_out,
        se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0); 
    );
end entity;

architecture arch of pip_reg3 is
    signal enable: std_logic := '1';
    -- signal reset: std_logic := '0';
    -- signal alu_cy_sig, alu_z_sig: std_logic;

    enable <= EN;
    -- alu_cy_sig <= alu_cy_in;

    ir_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ir_in;
        output=> ir_out;
    );

    pc_inc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>pc_inc_in;
        output=> pc_inc_out;
    );

    rf_d1_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>rf_d1_in;
        output=> rf_d1_out;
    );

    rf_d2_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>rf_d2_in;
        output=> rf_d2_out;
    );

    ls_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ls_in;
        output=> ls_out;
    );

    se_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_in;
        output=> se_out;
    );

    se_plus_pc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_plus_pc_in;
        output=> se_plus_pc_out;
    ); 

end architecture;

-- ////////////////////////////////////////////////////////////
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.misc.all;

entity pip_reg4 is
    port(
        EN,alu_cy_in, alu_z_in,clk, reset: in std_logic;
        ir_in, alu_or_eq_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
        se_plus_pc_in, pc_inc_in: in std_logic_vector(15 downto 0);
        ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
        se_plus_pc_out, pc_inc_out: out std_logic_vector(15 downto 0);
        alu_cy_out, alu_z_out: out std_logic;
    );
end entity;

architecture arch of pip_reg4 is
    signal enable: std_logic := '1';
    -- signal reset: std_logic := '0';
    -- signal alu_cy_sig, alu_z_sig: std_logic;

    enable <= EN;
    -- alu_cy_sig <= alu_cy_in;

    ir_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ir_in;
        output=> ir_out;
    );

    alu_or_eq_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>alu_or_eq_in;
        output=> alu_or_eq_out;
    );

    pc_inc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>pc_inc_in;
        output=> pc_inc_out;
    );

    rf_d1_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>rf_d1_in;
        output=> rf_d1_out;
    );

    rf_d2_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>rf_d2_in;
        output=> rf_d2_out;
    );

    ls_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ls_in;
        output=> ls_out;
    );

    se_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_in;
        output=> se_out;
    );

    se_plus_pc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_plus_pc_in;
        output=> se_plus_pc_out;
    );
    
    alu_cy_reg: reg_1
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=> alu_cy_in;
        output=> alu_cy_out;
    );

    alu_z_reg: reg_1
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=> alu_z_in;
        output=> alu_z_out;
    );
    

end architecture;

--//////////////////////////////////////////////////////////////////////
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.misc.all;

entity pip_reg5 is
    port(
        EN,alu_cy_in, alu_z_in,clk, reset: in std_logic;
        ir_in, alu_or_eq_in, rf_d1_in, rf_d2_in, ls_in, se_in, 
        se_plus_pc_in, pc_inc_in, mem_d_in: in std_logic_vector(15 downto 0);
        ir_out, alu_or_eq_out, rf_d1_out, rf_d2_out, ls_out, se_out,
        se_plus_pc_out, pc_inc_out, mem_d_out: out std_logic_vector(15 downto 0);
        alu_cy_out, alu_z_out: out std_logic;  
    );
end entity;

architecture arch of pip_reg5 is
    signal enable: std_logic := '1';
    -- signal reset: std_logic := '0';
    -- signal alu_cy_sig, alu_z_sig: std_logic;

    enable <= EN;
    -- alu_cy_sig <= alu_cy_in;

    ir_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ir_in;
        output=> ir_out;
    );

    alu_or_eq_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>alu_or_eq_in;
        output=> alu_or_eq_out;
    );

    pc_inc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>pc_inc_in;
        output=> pc_inc_out;
    );

    rf_d1_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>rf_d1_in;
        output=> rf_d1_out;
    );

    rf_d2_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>rf_d2_in;
        output=> rf_d2_out;
    );

    ls_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>ls_in;
        output=> ls_out;
    );
    
    mem_d_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>mem_d_in;
        output=> mem_d_out;
    );

    se_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_in;
        output=> se_out;
    );

    se_plus_pc_reg: reg_16
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=>se_plus_pc_in;
        output=> se_plus_pc_out;
    );
    
    alu_cy_reg: reg_1
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=> alu_cy_in;
        output=> alu_cy_out;
    );

    alu_z_reg: reg_1
    port map (
        EN => enable;
        reset=> reset;
        CLK=> clk;
        input=> alu_z_in;
        output=> alu_z_out;
    );
   
end architecture;







library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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
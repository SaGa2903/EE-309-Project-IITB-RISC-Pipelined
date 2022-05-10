library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Shift1 is
    port (
        opcode ; in std_logic_vector(3 downto 0);
        cz ; in std_logic_vector(1 downto 0);
        input : in std_logic_vector (15 downto 0);
        output : out std_logic_vector (15 downto 0)
    );
end entity;

architecture arch of Shift1 is
begin
    process(input, opcode)
        begin
    if opcode= "0001" and cz= "11" then        
    output(15 downto 1) <= input(14 downto 0);
    output(0) <= '0';
    else 
        output<= input;
    end if;    
    end process;
end arch;
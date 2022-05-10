library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SE is
    port (
        
        opcode : in std_logic_vector(3 downto 0);
        input_1 : in std_logic_vector (5 downto 0);
        input_2 : in std_logic_vector (8 downto 0);
        output : out std_logic_vector (15 downto 0)
    );
end entity;

architecture arch of SE is
begin
    
    process(input_1, input_2, opcode)
        begin
            if opcode ="0000" or opcode = "0111" or opcode= "0101" or opcode ="1000" then 
                output(5 downto 0) <= input;
                if input(5) = '1' then
	                output(15 downto 6) <= (others=>'1');
                else
	                output(15 downto 6) <= (others=>'0');
                end if;
            elsif opcode= "1001" or opcode= "1011" or opcode= "0011" then 
                output(8 downto 0) <= input;
                if input(8) = '1' then
                    output(15 downto 9) <= (others=>'1');
                else
                    output(15 downto 9) <= (others=>'0');
                end if;
            end if;    
        end process;
end arch;
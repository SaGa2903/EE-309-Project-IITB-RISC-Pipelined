library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc_inc is
    port(
        input: in std_logic_vector(15 downto 0);
        
        output : out std_logic_vector(15 downto 0)
    );
end entity;

architecture arch of pc_inc is
begin
    process( input)
    begin
        output<= std_logic_vector(unsigned(input)+1);
    end process;
end architecture;

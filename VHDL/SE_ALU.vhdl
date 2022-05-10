library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity se_alu is
    port(
        input_1: in std_logic_vector(15 downto 0);
        input_2: in std_logic_vector(15 downto 0);
        output : out std_logic_vector(15 downto 0)
    );
end entity;

architecture arch of se_alu is
begin
    process( input_1, input_2)
    begin
        output<= std_logic_vector(unsigned(input_1)+ unsigned(input_2));
    end process;
end arch;

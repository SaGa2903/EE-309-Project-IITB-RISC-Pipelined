library ieee;
use ieee.std_logic_1164.all;

entity reg_8 is
    port(
        EN: in std_logic;
        reset, CLK: in std_logic;
        input: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(15 downto 0)
	);
end entity;

architecture arch of reg_8 is
begin
    r1: process(CLK, EN, reset)

    begin
        if reset='1' then
            output(15 downto 0) <= (others => '0');
        elsif CLK'event and CLK='0' then
            if EN ='1' then
                output <= input;
            end if;
        end if ;
    end process;
end arch;
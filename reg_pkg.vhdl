library ieee;
use ieee.std_logic_1164.all;

package misc is 
    component reg_16 is
        port(
            EN: in std_logic;
            reset, CLK: in std_logic;
            input: in std_logic_vector(15 downto 0);
            output: out std_logic_vector(15 downto 0)
        );
    end component;  
    
    component reg_1 is
        port(
            EN: in std_logic;
            reset, CLK: in std_logic;
            input: in std_logic;
            output: out std_logic;
        );
    end component;  
end package;


entity reg_16 is
    port(
        EN: in std_logic;
        reset, CLK: in std_logic;
        input: in std_logic_vector(15 downto 0);
        output: out std_logic_vector(15 downto 0)
	);
end entity;

architecture arch of reg_16 is
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

entity reg_1 is
    port(
        EN: in std_logic;
        reset, CLK: in std_logic;
        input: in std_logic
        output: out std_logic
	);
end entity;

architecture arch of reg_1 is
begin
    r1: process(CLK, EN, reset)

    begin
        if reset='1' then
            output<='0';
        elsif CLK'event and CLK='0' then
            if EN ='1' then
                output <= input;
            end if;
        end if ;
    end process;
end arch;
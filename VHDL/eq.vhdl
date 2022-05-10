library ieee;
use ieee.std_logic_1164.all;

entity eq is
	port(
		
		eq1: in std_logic_vector(15 downto 0); -- rf_d1
		eq2: in std_logic_vector(15 downto 0);-- rf_d2
		eq3: in std_logic_vector(15 downto 0); -- pc_inc
		eq4: in std_logic_vector(15 downto 0);-- se+pc
		eq_out: out std_logic_vector(15 downto 0));
		
end entity;

architecture arch of eq is
begin
    p1: process(eq1, eq2)
    begin
	if eq1=eq2 then
		eq_out <= eq4;
	else
		eq_out<= eq3;
	end if;		
    end process;

end arch;
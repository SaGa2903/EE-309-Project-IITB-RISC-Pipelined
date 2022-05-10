library ieee;
use ieee.std_logic_1164.all;


entity DUT is
   port(input_vector: in std_logic_vector(1 downto 0)
       );
end entity;

architecture arch of DUT is

	component datapath is
    port(
        
        clk, reset: in std_logic

    );
end component;

begin
   instance: datapath
		port map(
			reset => input_vector(1),
			clk => input_vector(0)			
		);

end arch;
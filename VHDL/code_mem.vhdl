library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity code_mem is
port(
    address_in: in std_logic_vector(15 downto 0);
    clk: in std_logic;
    d_out: out std_logic_vector(15 downto 0)
);
end entity code_mem;

architecture arch of code_mem is
    signal add_in: std_logic_vector(15 downto 0);
    type mem_block is array (0 to 255) of std_logic_vector (15 downto 0); --512 Byte memory
    signal data_temp: mem_block := ("0001101100011000","1100101011010011","0011000001010000", others => (others =>'0'));
begin
 
    add_in <= address_in;
    d_out <= data_temp(to_integer(unsigned(add_in(7 downto 0))));

end arch;




    
    

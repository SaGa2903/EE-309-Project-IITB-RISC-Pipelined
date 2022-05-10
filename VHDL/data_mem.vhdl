library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_mem is
port(
    mem_a, mem_din: in std_logic_vector(15 downto 0);
    clk: in std_logic;
    opcode: in std_logic_vector(3 downto 0);
    d_out: out std_logic_vector(15 downto 0)
);
end entity data_mem;

architecture arch of data_mem is
    signal add_in, d_in: std_logic_vector(15 downto 0);
    signal wb_en: std_logic;
    type mem_block is array (0 to 255) of std_logic_vector (15 downto 0); --512 Byte memory
    signal data_temp: mem_block := (others => (others =>'0'));
begin

    p1: process(clk)
    
    begin

        if opcode = "0111" then --LW
            add_in<= mem_a;
            wb_en <= '0';
        elsif opcode = "0101" then --SW
            add_in<= mem_a;
            d_in <= mem_din;
            wb_en <= '1';
        end if;
        
        -- write_back
        if(clk'event and clk = '0') then
          if (wb_en='1') then
            data_temp(to_integer(unsigned(add_in(7 downto 0)))) <= d_in;
          end if;
        end if;

    end process;

    d_out <= data_temp(to_integer(unsigned(add_in(7 downto 0))));

  end arch;




    
    

library ieee;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_1164.all;

entity alu is
    port(
        opcode: in std_logic_vector(3 downto 0);
        cz: in std_logic_vector(1 downto 0); -- last 2 bits of instruction
         input_1, input_2: in std_logic_vector(15 downto 0); --put a mux in input_2 for immediate data (from SE)
         output: out std_logic_vector(15 downto 0);
       
        CY: out std_logic; -- carry flag
        Z: out std_logic;   -- zero flag
        Cin,Zin,clk: in std_logic       

    );
end entity;

architecture arch of alu is
    
	signal alu_out, temp_a, temp_b: std_logic_vector(16 downto 0);

begin
    alu1: process(opcode,cz, clk, Cin, Zin,input_1, input_2)

		begin
          
        temp_a <= '0' & input_1;
        temp_b <= '0' & input_2;
        CY <= Cin;
        Z<= Zin;

        if opcode = "0010" and cz="00" then
          alu_out(15 downto 0) <= temp_a(15 downto 0) nand temp_b(15 downto 0);
        elsif opcode= "0010" and cz="10" and Cin= '1' then
            alu_out(15 downto 0) <= temp_a(15 downto 0) nand temp_b(15 downto 0);
        elsif opcode= "0010" and cz="01" and Zin= '1' then
            alu_out(15 downto 0) <= temp_a(15 downto 0) nand temp_b(15 downto 0);
        --add instructions
        elsif opcode= "0001" and cz="10" and Cin= '1' then
            alu_out <= std_logic_vector(unsigned(temp_a)+unsigned(temp_b));
			CY <= alu_out(16);
        elsif opcode= "0001" and cz="01" and Zin= '1' then
            alu_out <= std_logic_vector(unsigned(temp_a)+unsigned(temp_b));
            CY <= alu_out(16); 
        elsif  opcode= "0001" and (cz="00" or cz="11") then        
            alu_out <= std_logic_vector(unsigned(temp_a)+unsigned(temp_b));
            CY <= alu_out(16); 
        elsif opcode="0000" then
            alu_out <= std_logic_vector(unsigned(temp_a)+unsigned(temp_b));
            CY <= alu_out(16); 
        elsif opcode="1011" then
            alu_out <= std_logic_vector(unsigned(temp_a)+unsigned(temp_b));
        end if;

        if alu_out(15 downto 0)="0000000000000000" then
            Z <= '1';
        else Z<= '0';
        end if;
        
        output <= alu_out(15 downto 0);

    end process;
    end arch;
        







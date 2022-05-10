library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity reg_file is
port (
    CLK ,reset: in std_logic;
    ir, d3: in std_logic_vector(15 downto 0);
    d1, d2 : out std_logic_vector(15 downto 0);
  );
end entity reg_file;


architecture arch of reg_file is

	signal r0, r1, r2, r3, r4, r5, r6, r7: std_logic_vector(15 downto 0):= (others => '0');
  signal a1,a2,a3: std_logic_vector(2 downto 0):= (others => '0');
  signal wb_en: std_logic;

  begin

  
  p1: process(clk, reset, ir, d3)
    begin
      a1 <= ir(11 downto 9);
      a2 <= ir(8 downto 6);

    if ir(15 downto 12) = "0001" or ir(15 downto 12) = "0010" then
        a3 <= ir(5 downto 3);
        wb_en <= '1';
    elsif ir(15 downto 12) = "0011" or ir(15 downto 12) = "0111" or ir(15 downto 12) = "1001" or ir(15 downto 12) = "1010" then
        a3 <= ir(11 downto 9);
        wb_en <= '1';
    elsif ir(15 downto 12) = "0000" then
        a3 <= ir(8 downto 6);
        wb_en <= '1';
    end if

    -- wr: process(a1,CLK, rf_cw(6))
    --   begin
      if(reset= '1') then
        r0 <= (others => '0');
        r1 <= (others => '0');
        r2 <= (others => '0');
        r3 <= (others => '0');
        r4 <= (others => '0');
        r5 <= (others => '0');
        r6 <= (others => '0');
        r7 <= (others => '0');
      elsif(CLK'event and CLK='0') then
          if (wb_en = '1') then
            case a3 is
              when "000" =>
                r0<= d3;
              when "001" =>
                r1<= d3;
              when "010" =>
                r2<= d3;
              when "011" =>
                r3<= d3;
              when "100" =>
                r4<= d3;
              when "101" =>
                r5<= d3; 
              when "110" =>
                r6<= d3;
              when others =>
                r7<= d3;              
            end case;
          end if;
      end if;

      --read
        case a1 is
          when "000" =>
            d1<= r0;
          when "001" =>
            d1<= r1;
          when "010" =>
            d1<= r2;
          when "011" =>
            d1<= r3;
          when "100" =>
            d1<= r4;
          when "101" =>
            d1<= r5; 
          when "110" =>
            d1<= r6;
          when others =>
            d1<= r7;              
        end case;      
      
      --read
        case a2 is
          when "000" =>
            d2<= r0;
          when "001" =>
            d2<= r1;
          when "010" =>
            d2<= r2;
          when "011" =>
            d2<= r3;
          when "100" =>
            d2<= r4;
          when "101" =>
            d2<= r5; 
          when "110" =>
            d2<= r6;
          when others =>
            d2<= r7;              
        end case;
  end process;

end arch;






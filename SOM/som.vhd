library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sum2 is
	generic(width: natural);
	port(clk: in std_logic;
		 x:in signed(width-1 downto 0);
		 y: out signed(width-1 downto 0));
end entity;


architecture beh of sum2 is
  signal z : signed(width-1 downto 0);
begin
  process (clk)
  begin
  	if rising_edge(clk) then
  		y<= x + z;
  		z<= x;
  	end if;    
  end process;

end architecture;

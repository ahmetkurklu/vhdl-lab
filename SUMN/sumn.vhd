library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sumn is
	generic(width: natural; n: natural);
	port(	clk : std_logic;
			x: in signed(width-1 downto 0);
			y: out signed(width-1 downto 0));
end entity;

architecture seq of sumn is
	type t_mem is array(0 to n-2) of signed(width-1 downto 0);
	signal mem : t_mem;
	
	begin
	process(clk)
	variable tmp : signed(width-1 downto 0);
	begin
		if rising_edge(clk) then
			tmp:=x;
			for i in 0 to n-2 loop
				tmp := tmp + mem(i);
			end loop;
			y<=tmp;
			for i in n-2 downto 1 loop
				mem(i)<= mem(i-1);
			end loop;
			mem(0)<=x;
		end if;
	end process;
end architecture;

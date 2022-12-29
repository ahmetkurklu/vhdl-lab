library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fir3 is
  generic(width:natural);
  port (clk: in std_logic;
        x : in signed (width-1 downto 0);
        y : out signed (2*width-1 downto 0));
end entity;


	
architecture seq of fir3 is

    type cst_array is array(natural range <>) of integer;
    constant constante : cst_array := (3,2,1);
    
    signal z1 : signed(width -1 downto 0);
    signal z2 : signed(width -1 downto 0);
    
    
    
    function add_saturate(signal a : signed; signal b: signed) return signed is
		variable r: signed(width-1 downto 0);
		begin
			r := a+b;
			if(a(a'left) = b(b'left)) then 
				if(r(r'left) = a(a'left)) then
					return r;
				else
					r(r'left) := a(a'left);
					if(r(r'left) = '1') then
						r:= (others =>'0');
						r(r'left):= '1';
						return r;
					else
						r:= (others => '1');
						r(r'left):= '0';
						return r;
					end if;
				end if;
			else
				return r;
			end if;
	end;

    
    
    begin
    process(clk)
        begin
            if rising_edge(clk) then
                y <= to_signed(constante(0), width) * x + to_signed(constante(1), width) * z1 + to_signed(constante(2), width) * z2;
                z1 <= x;
                z2 <= z1;
            end if;
    end process;
end architecture;

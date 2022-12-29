library ieee;
use ieee.std_logic_1164.all;

entity cdcnt is
    port
    (
    clk : in std_logic;
    lc : in std_logic;
    ud : in std_logic;
    d : in integer range 0 to 9;
    cb : out std_logic;
    q: out integer range 0 to 9
    );
    
end entity;

architecture behavior of cdcnt is 
	signal cnt : integer range 0 to 9;
begin
	process(clk,lc,ud)
	begin
		if rising_edge(clk)then
			if lc = '0'then
				cnt <= d;
			else
				if ud = '1'then
					if cnt = 9 then
						cnt<=0;
						cb<='1';
					else
						cnt<=cnt+1;
						cb<='0';
					end if;
				else
					if cnt = 0 then
						cnt<=9;
						cb<='1';
					else
						cnt<=cnt-1;
						cb<='0';
					end if;
				end if;
			end if;
		end if;
	end process;
	q<=cnt;
end architecture;

library ieee;
use ieee.std_logic_1164.all;

entity max4 is
    port
    (e1 : in integer;
     e2 : in integer;
     e3 : in integer;
     e4 : in integer;
     S : out integer 
    );
    
end entity;

architecture behavior of max4 is 
    
    signal s1,s2 : integer;

begin
	exmax0 : entity work.exmax port map(e1, e2, s1);
	exmax1 : entity work.exmax port map(e3, s1, s2);
	exmax2 : entity work.exmax port map(s2, e4, S);
		
end architecture;

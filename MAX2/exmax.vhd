library ieee;
use ieee.std_logic_1164.all;

entity exmax is
    port
    (e1 : in integer;
     e2 : in integer;
     S : out integer 
    );
    
end entity;

architecture behavior of exmax is 
begin
	S<= e1 when e1>e2 else
		e2 when e1<e2 else
		e1;
		
end architecture;

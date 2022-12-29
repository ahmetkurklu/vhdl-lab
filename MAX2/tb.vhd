library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture behav of tb is

component exmax
    port
    (e1 : in integer;
     e2 : in integer;
     S : out integer 
    );
end component;

	 signal e1 : integer;
     signal e2 : integer;
     signal S : integer; 


begin
    E: exmax port map (e1, e2, S);

    process
        begin
            e1 <=10;e2 <=5; wait for 10 ns;
           	e1 <=4 ;e2 <=8; wait for 10 ns;
           	e1 <=14;e2 <=6; wait for 10 ns;
           	e1 <=15;e2 <=3; wait for 10 ns;
           	e1 <=1 ;e2 <=5; wait for 10 ns;
           	e1 <=25;e2 <=3; wait for 10 ns;
            wait;
    end process;
end architecture;

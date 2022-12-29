library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture behav of tb is

component max4
    port
    (e1 : in integer;
     e2 : in integer;
     e3 : in integer;
     e4 : in integer;
     S : out integer 
    );
end component;

	 signal e1 : integer;
     signal e2 : integer;
     signal e3 : integer;
     signal e4 : integer;
     signal S : integer; 


begin
    M: entity work.max4 port map(e1, e2, e3, e4, S);

    process
        begin
            e1 <=10;e2 <=5;e3 <=20;e4 <=35; wait for 10 ns;
            e1 <=8;e2 <=50;e3 <=10;e4 <=2; wait for 10 ns;
            e1 <=32;e2 <=20;e3 <=10;e4 <=7; wait for 10 ns;
            e1 <=98;e2 <=3;e3 <=27;e4 <=26; wait for 10 ns;
            wait;
    end process;
end architecture;

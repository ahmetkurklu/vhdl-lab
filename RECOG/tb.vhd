library ieee;
use ieee.std_logic_1164.all;	   
use ieee.numeric_std.all;

entity tb is
end tb;

architecture seq of tb is
    
    signal e 	:  std_logic;
   	signal h 	:  std_logic;
   	signal rst 	:  std_logic;
   	signal s 	:  std_logic;

begin

  UUT: entity work.recog port map(e, h, rst, s);
  
  CLOCK: process
  begin
    h<='0';
    wait for 5 ns;
    h<='1';
    wait for 5 ns;
  end process;

  RESET:process
  begin
    rst <= '1'; 
    wait for 1 ns;
   	rst <= '0'; 
    wait for 2 ns;
    wait;
  end process;
  
  
  ENTRE:process
  begin
    e <= '0'; 
    wait for 10 ns;
    e <= '1'; 
    wait for 10 ns;
    e <= '0'; 
    wait for 10 ns;
    e <= '1'; 
    wait for 20 ns;
    e <= '0'; 
    wait for 10 ns;
    e <= '1'; 
    wait for 30 ns;
    e <= '0'; 
    wait for 10 ns;
    e <= '1'; 
    wait for 40 ns;
    wait;
  end process; 
  
  
end architecture;


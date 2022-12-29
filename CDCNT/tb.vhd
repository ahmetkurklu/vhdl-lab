library ieee;
use ieee.std_logic_1164.all;	   
use ieee.numeric_std.all;

entity tb is
end tb;

architecture seq of tb is
  
  	signal clk : std_logic;
    signal lc  : std_logic;
    signal ud  : std_logic;
    signal d   : integer range 0 to 9;
    signal cb  : std_logic;
    signal q   : integer range 0 to 9;

begin

  UUT: entity work.cdcnt port map(clk, lc, ud, d, cb, q);
  
  CLOCK: process
  begin
    clk<='1';
    wait for 1 ns;
    clk<='0';
    wait for 1 ns;
  end process;

  LoadCount:process
  begin
    lc <= '0'; 
    wait for 10 ns;
    lc <= '1'; 
    wait for 100 ns;
    wait;
  end process;
  
  
  UpDown:process
  begin
    ud <= '0'; 
    wait for 50 ns;
    ud <= '1'; 
    wait for 50 ns;
    wait;
  end process;
  
   process
        begin
            d <=4; wait for 10 ns;
            d<= 0; wait for 0 ns;
            wait;
   end process;
  
  
  
end architecture;


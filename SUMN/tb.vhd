library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb is
  end tb;
  
architecture behav of tb is
    
  constant a    : natural := 5;
  constant largeur : natural := 9;
  signal   x    : signed(largeur-1 downto 0);
  signal   y    : signed(largeur-1 downto 0);
  signal   clk  : std_logic;
      
begin

  UUT : entity work.sumn generic map (width=> largeur,n=> a) port map (clk, x,y);

  CLOCK : process
  begin
    clk<='0';
    wait for 5 ns;

    clk<='1';
    wait for 5 ns;
  end process;

  STIM : process

    type pattern_array is array(natural range <>) of integer;
    constant patterns : pattern_array := (0,2,4,6,-8,-6,4,-2,0,2,6,4,5,1,2,0,0,3,1,2,4,5,3,2);

  begin

    for i in patterns'range loop
      x <= to_signed(patterns(i),largeur);
      wait for 10 ns;
    end loop;

    assert false report "end of test" severity note;
    wait;
  end process;

end architecture;

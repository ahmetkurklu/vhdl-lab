library ieee;
use ieee.std_logic_1164.all;	   
use ieee.numeric_std.all;

entity tb is
end tb;

architecture seq of tb is
    	
   	signal clk			: std_logic;
    signal write_enable	: std_logic;
    signal data_in		: std_logic_vector (7 downto 0);
    signal addr			: integer range 0 to 15;
    signal data_out		: std_logic_vector (7 downto 0);

begin

  M: entity work.ram port map(clk,write_enable,data_in,addr,data_out);
  
  CLOCK: process
  begin
    clk<='0';
    wait for 50 ns;
    clk<='1';
    wait for 50 ns;
  end process;

  STIMULATE:process
  begin
    write_enable <= '1';
    addr <=3;
    data_in <= std_logic_vector(to_unsigned(50,8)); 
    wait for 100 ns;
    addr <=4;
    data_in <= std_logic_vector(to_unsigned(51,8)); 
    wait for 100 ns;
    addr <=5;
    data_in <= std_logic_vector(to_unsigned(52,8)); 
    wait for 100 ns;
    write_enable <= '0';
    data_in <= std_logic_vector(to_unsigned(0,8)); 
   	wait for 100 ns;
   	addr<=3;
   	wait for 100 ns;
   	addr<=4;
   	wait for 100 ns;
   	addr<=5; 
   	wait for 100 ns;
  end process;
  
  
end architecture;



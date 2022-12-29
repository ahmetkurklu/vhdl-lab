library ieee;
use ieee.std_logic_1164.all;

entity ram is
  port (
        clk: in std_logic;
        write_enable: in std_logic;
        data_in: in std_logic_vector (7 downto 0);
        addr: in integer range 0 to 15;
        data_out: out std_logic_vector (7 downto 0));
end ram;

architecture seq of ram is
  type tableau_memoire is array (0 to 15) of std_logic_vector(7 downto 0);
  signal memoire : tableau_memoire;
begin
  process (clk)
  begin
    if rising_edge(clk) then
        if (write_enable='1') then --DEBUT ECRITURE
            memoire(addr) <= data_in;
        end if ;
    end if;
  end process;
  data_out <= memoire(addr); 
end architecture;

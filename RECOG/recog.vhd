library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity recog is
  port (e: in std_logic;
        h: in std_logic;
        rst: in std_logic;
        s: out std_logic);
end entity;

architecture beh of recog is
  signal cnt : integer range 0 to 3;
begin
  process (h,rst)
  begin
    if rst ='1' then --RAZ 
        cnt<=0;
    elsif rising_edge(h) then
        if e='1' then
            if cnt<3 then
                cnt <= cnt+1;
            end if ;
        else
            cnt <=0;
        end if;
    end if;
  end process;
s <= '1' when cnt >=3 else '0';
end architecture;

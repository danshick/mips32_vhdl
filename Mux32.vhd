library ieee;
use ieee.std_logic_1164.all;
entity MUX32 is
port(x,y:in std_logic_vector (31 downto 0);
     sel:in std_logic;
     z:out std_logic_vector(31 downto 0));
end MUX32;



architecture behav of MUX32 is
begin
  process(sel,x,y)
    begin
      if sel='0'then
        z <= x;
      else
        z <= y;
      end if;
  end process;
end behav;


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;  
use ieee.numeric_std.all;

entity SignExtend is

  port(x:in std_logic_vector(15 downto 0);
        y:out std_logic_vector(31 downto 0));

end SignExtend;

architecture behav of SignExtend is
begin
  
  process( x )
    
  variable myInt: integer;
    
  begin
      
      y <= sxt( x, y'LENGTH );
    
  end process;
  
end behav;
    
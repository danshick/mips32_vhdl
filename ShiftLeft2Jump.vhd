library ieee;
use ieee.std_logic_1164.all;
entity ShiftLeft2Jump is
  port(x:in std_logic_vector(25 downto 0);y:in std_logic_vector(3 downto 0);
        z:out std_logic_vector(31 downto 0));
end ShiftLeft2Jump;

architecture df of ShiftLeft2Jump is
begin
  
  z( 31 downto 28 ) <= y( 3 downto 0 );
  z( 27 downto 2 ) <= x( 25 downto 0 );
  z( 1 downto 0 ) <= "00";

end df;
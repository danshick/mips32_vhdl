library ieee;
use ieee.std_logic_1164.all;

entity Nor32 is

  port(x:in std_logic_vector(31 downto 0);
        y:out std_logic);

end Nor32;


architecture df of Nor32 is
begin

  y <= not (x(31) or x(30) or x(29) or x(28) or x(27) or x(26) or x(25) or x(24) or x(23) or x(22) or x(21) or x(20) or x(19) or x(18) or x(17) or x(16) or x(15) or x(14) or x(13) or x(12) or x(11) or x(10) or x(9) or x(8) or x(7) or x(6) or x(5) or x(4) or x(3) or x(2) or x(1) or x(0));

end df;

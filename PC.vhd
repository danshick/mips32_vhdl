library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC is
  
  port(clk:in std_logic;
        AddressIn:in std_logic_vector(31 downto 0);
        AddressOut:buffer std_logic_vector(31 downto 0));

end PC;

architecture behav of PC is
begin
  
  process( CLK )
  
  begin
    
    if rising_edge( CLK ) then
      
      if AddressOut = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" then
      
        AddressOut <= "00000000000000000000000000000000";
      
      else
        
        AddressOut <= AddressIn;
      
      end if;
      
    end if;
    
  end process;
  
end behav;
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity InstMemory is

port( Address: in std_logic_vector( 31 downto 0 );
     ReadData: out std_logic_vector( 31 downto 0 ) );
     
end InstMemory;

architecture behav of InstMemory is
	
	type marr is array( 255 downto 0 ) of std_logic_vector( 7 downto 0 );
	signal MemArr: marr :=(
	0 => "01010101",
	1 => "11001100",
	2 => "00110011",
	3 => "01010111",
	4 => "11000011",
	5 => "11110000",
	6 => "00001111",
	7 => "11111111",
	others => "UUUUUUUU" );
	
	begin
	
		process( Address )
		
		begin
			
							ReadData <= MemArr( conv_integer( Address ) ) & MemArr( conv_integer( Address ) + 1) & MemArr( conv_integer( Address ) + 2 ) & MemArr( conv_integer( Address ) + 3);

			
	end process;
		
end behav;
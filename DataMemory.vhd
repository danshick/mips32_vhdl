library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity DataMemory is

port( WriteData: in std_logic_vector( 31 downto 0 );
     Address: in std_logic_vector( 31 downto 0 );
     MemRead, MemWrite: in std_logic;
     ReadData: out std_logic_vector( 31 downto 0 ) );
     
end DataMemory;

architecture behav of DataMemory is

	type marr is array( 255 downto 0 ) of std_logic_vector( 7 downto 0 );
	signal MemArr: marr := (
	 
	 0 => "00000000",
	 1 => "00000000",
	 2 => "00000000", 
	 3 => "00000101",
	 4 => "00000000",
	 5 => "00000000",
	 6 => "00000000",
	 7 => "00000100",
	 others => "UUUUUUUU" );
	
	begin
	
		process( Address, MemRead, MemWrite, WriteData )
		
		begin
			
			if MemWrite = '1' and MemRead = '0' then
				
				MemArr( conv_integer( Address ) ) <= WriteData(31 downto 24);
				MemArr( conv_integer( Address ) + 1 ) <= WriteData(23 downto 16);
				MemArr( conv_integer( Address ) + 2 ) <= WriteData(15 downto 8);
				MemArr( conv_integer( Address ) + 3 ) <= WriteData(7 downto 0);
				
			elsif MemWrite = '0' and MemRead = '1' then
				
				ReadData <= MemArr( conv_integer( Address ) ) & MemArr( conv_integer( Address ) + 1) & MemArr( conv_integer( Address ) + 2 ) & MemArr( conv_integer( Address ) + 3);
				
			end if;
			
	end process;
		
end behav;
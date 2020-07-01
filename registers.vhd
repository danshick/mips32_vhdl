library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity registers is

  port( RR1, RR2, WR: in std_logic_vector( 4 downto 0 );
       WD: in std_logic_vector( 31 downto 0 );
       RegWrite: in std_logic;
       RD1, RD2: out std_logic_vector( 31 downto 0 ) );
       
end registers;

architecture behav of registers is
	
	type reg is array( 31 downto 0 ) of std_logic_vector( 31 downto 0 );
	signal reglist: reg := (
	0 => "00000000000000000000000000000000",
	8 => "00000000000000000000000000000000",
	20 => "00000000000000000000000000001110",
	21 => "00000000000000000000000000000101",
	others => "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU" );
	
	begin
		
		process( RR1, RR2, WR, WD, RegWrite )
		
		begin
			
			if RegWrite = '1' and WR /= "00000" then
				
				reglist( conv_integer( WR ) ) <= WD;
				
			end if;
				
			RD1 <= reglist( conv_integer( RR1 ) );
			RD2 <= reglist( conv_integer( RR2 ) );
			
	end process;
	
end behav;
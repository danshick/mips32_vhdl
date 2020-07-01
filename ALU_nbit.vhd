library ieee;
use ieee.std_logic_1164.all;
entity ALU_nbit is
generic(n:natural:=32);
port(a,b:in std_logic_vector(n-1 downto 0);
	  Oper:in std_logic_vector(3 downto 0);
	  Result:out std_logic_vector(n-1 downto 0);
	  Zero:out std_logic;
	  CarryOut,Overflow:buffer std_logic);
 end ALU_nbit;
 
 architecture struc of ALU_nbit is
 component ALU_1bit
   
  port(a,b,less,CarryIn:in std_logic;
      Ainvert,Binvert,Op1,Op0:in std_logic;
      Result,CarryOut,set:out std_logic);
    end component;  
    
    
 signal rip_carry:std_logic_vector(n-2 downto 0);
 signal set31,set31_to_less0:std_logic;
 
 begin
   
   G1: for i in 0 to n-1 generate
     
     G2:if i=0 generate
     ALU0:ALU_1bit port map(a(i),b(i),set31_to_less0,Oper(2),Oper(3),Oper(2),Oper(1),Oper(0),Result(i),rip_carry(i),open);
   end generate G2;
     
     G3:if i>0 and i<n-1 generate
     ALUi:ALU_1bit port map(a(i),b(i),'0',rip_carry(i-1),Oper(3),Oper(2),Oper(1),Oper(0),Result(i),rip_carry(i),open);
  end generate G3;
  
     G4:if i=n-1 generate
     ALUn_1:ALU_1bit port map(a(i),b(i),'0',rip_carry(i-1),Oper(3),Oper(2),Oper(1),Oper(0),Result(i),CarryOut,set31);
   end generate G4;
   
 end generate G1;

if result = "00000000000000000000000000000000" then
	
	Zero <= '1';
	
else
	
	Zero <= '0';
	
end if;

overflow<=rip_carry(n-2) xor CarryOut;
set31_to_less0<=set31 xor overflow;

end struc;

   
 
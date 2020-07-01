library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ALU_Control is

port(ALUOp:in std_logic_vector(1 downto 0);
     Funct:in std_logic_vector(5 downto 0);
     Operation:out std_logic_vector(3 downto 0));
     
end ALU_Control;

architecture behav of ALU_Control is

begin

  process(Funct, ALUOp)
  
  CONSTANT c_ADD : std_logic_vector(5 downto 0) := "100000";
  CONSTANT c_SUB : std_logic_vector(5 downto 0) := "100010";
  CONSTANT c_AND : std_logic_vector(5 downto 0) := "100100";
  CONSTANT c_OR  : std_logic_vector(5 downto 0) := "100101";
  CONSTANT c_SLT : std_logic_vector(5 downto 0) := "101010";
  
  begin
  
    case ALUOp is
    
         when "00" => Operation <= "0010"; --addition  
         when "01" => Operation <= "0110"; --  subtract case
         when "10" =>    --  depends on function field. cases are
         
          case Funct is
          
            when c_ADD => Operation <= "0010";  --addition
            when c_SUB => Operation <= "0110"; --for subtract
            when c_AND => Operation <= "0000"; -- And
            when c_OR => Operation <= "0001"; -- Or
            when c_SLT => Operation <= "0111"; -- Less than Slt
            when others => Operation <= "0000"; --assimilate to And case
            
          end case;
          
        when others => Operation <= "0000";
        
      end case;
      
    end Process;
    
   end behav;
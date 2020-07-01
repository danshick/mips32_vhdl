library ieee;
use ieee.std_logic_1164.all;
entity ALU_1bit is
  
  port(a,b,less,CarryIN:in std_logic;
    Ainvert,Binvert,Op1,Op0:in std_logic;
    Result,CarryOut,set:out std_logic );
end ALU_1bit;


architecture behav of ALU_1bit is 
  begin
    process (a,b,less,CarryIN,Ainvert,Binvert,Op1,Op0 )
      
      variable con: std_logic_vector(3 downto 0);
      begin
        
        con := Ainvert & Binvert & Op1 & Op0 ; 
        
        case con is
          when "0000" => result <= a and b; --and
          when "0001" => result  <= a or b; --or
            
          when "0010" => result <= a xor b xor CarryIN; --add
                         CarryOut <= (a and b) or (a and CarryIn) or (b and CarryIn);
          
          when "0110" => result <= a xor (not b) xor CarryIN; --subtract
                         CarryOut <= (a and (not b)) or (a and CarryIn) or ((not b) and CarryIn);
                                       
          when "0111" => set <= a xor (not b) xor CarryIN; --set on less than
                         CarryOut <= (a and (not b)) or (a and CarryIn) or ((not b) and CarryIn); 
                         result <= less;
          
          when "1100" => result <= (not a) and (not b); --nor
                           
          
          when others => result <= 'U';
                         CarryOut <= 'U';
                         set<= 'U';
        end case;
    end process;
                        

end behav; 
       
        
 
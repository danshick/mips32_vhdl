library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Control is

	port(Opcode:in std_logic_vector(5 downto 0);
			RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump:out std_logic;
			ALUOp:out std_logic_vector(1 downto 0));
			
end Control;

architecture behav of ALU_Control is

begin
	
  process(Opcode)
  
  begin
  
  case Opcode is
  	
  	--R-Type
  	when "000000" => 
  		RegDst <= '1';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '0';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "10";
  	--I-Type
  	when "001000" => --addi
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "001001" => --addiu
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "001100" => --andi
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "000100" => --beq
  		RegDst <= '0';
  		Branch <= '1';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '0';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "01";
  	when "000101" => --bne
  		RegDst <= '0';
  		Branch <= '1';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '0';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "01";
  	when "100100" => --lbu
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '1';
  		MemtoReg <= '1';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "100101" => --lhu
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '1';
  		MemtoReg <= '1';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "001111" => --lui
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '1';
  		MemtoReg <= '1';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "100011" => --lw
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '1';
  		MemtoReg <= '1';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "001101" => --ori
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '1';
  		RegWrite <= '1';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "101000" => --sb
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '1';
  		ALUSrc <= '1';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "001010" => --slti
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '1';
  		ALUSrc <= '1';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "001011" => --sltiu
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '1';
  		ALUSrc <= '1';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "101001" => --sh
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '1';
  		ALUSrc <= '1';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "00";
  	when "101011" => --sw
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '1';
  		ALUSrc <= '1';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "00";
  	--J-Type
  	when "000010" => --j
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '0';
  		RegWrite <= '0';
  		Jump <= '1';
  		ALUOp <= "00";
  	when "000011" => --jal
  		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '0';
  		RegWrite <= '0';
  		Jump <= '1';
  		ALUOp <= "00";
  	--others
	when others =>
		RegDst <= '0';
  		Branch <= '0';
  		MemRead <= '0';
  		MemtoReg <= '0';
  		MemWrite <= '0';
  		ALUSrc <= '0';
  		RegWrite <= '0';
  		Jump <= '0';
  		ALUOp <= "00";

  	end case;
  	
end process;

end behav;
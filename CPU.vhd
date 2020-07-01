entity CPU is
	
	port(clk:in std_logic; Overflow:out std_logic);
	
end CPU;

architecture struc of CPU is

component ALU_Control is

port(ALUOp:in std_logic_vector(1 downto 0);
     Funct:in std_logic_vector(5 downto 0);
     Operation:out std_logic_vector(3 downto 0));
     
end component;

component ALU_nbit is
generic(n:natural:=32);

port(a,b:in std_logic_vector(n-1 downto 0);
	  Oper:in std_logic_vector(3 downto 0);
	  Result:out std_logic_vector(n-1 downto 0);
	  Zero:out std_logic;
	  CarryOut,Overflow:buffer std_logic);
	  
end ALU_nbit;

component And2 is

  port(x,y:in std_logic;
        z:out std_logic);

end component;

component Control is

	port(Opcode:in std_logic_vector(5 downto 0);
			RegDst,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite,Jump:out std_logic;
			ALUOp:out std_logic_vector(1 downto 0));
			
end component;

component DataMemory is

port( WriteData: in std_logic_vector( 31 downto 0 );
     Address: in std_logic_vector( 31 downto 0 );
     MemRead, MemWrite: in std_logic;
     ReadData: out std_logic_vector( 31 downto 0 ) );
     
end component;

component InstMemory is

port( Address: in std_logic_vector( 31 downto 0 );
     ReadData: out std_logic_vector( 31 downto 0 ) );
     
end component;

component MUX5 is
port(x,y:in std_logic_vector (4 downto 0);
     sel:in std_logic;
     z:out std_logic_vector(4 downto 0));
end component;

component MUX32 is
port(x,y:in std_logic_vector (31 downto 0);
     sel:in std_logic;
     z:out std_logic_vector(31 downto 0));
end component;

component Nor32 is

  port(x:in std_logic_vector(31 downto 0);
        y:out std_logic);

end component;

component PC is
  
  port(clk:in std_logic;
        AddressIn:in std_logic_vector(31 downto 0);
        AddressOut:buffer std_logic_vector(31 downto 0));

end component;

component registers is

  port( RR1, RR2, WR: in std_logic_vector( 4 downto 0 );
       WD: in std_logic_vector( 31 downto 0 );
       RegWrite: in std_logic;
       RD1, RD2: out std_logic_vector( 31 downto 0 ) );
       
end component;

component ShiftLeft2 is
  port(x:in std_logic_vector(31 downto 0);
        y:out std_logic_vector(31 downto 0));
end component;

component ShiftLeft2Jump is
  port(x:in std_logic_vector(25 downto 0);y:in std_logic_vector(3 downto 0);
        z:out std_logic_vector(31 downto 0));
end component;

component SignExtend is

  port(x:in std_logic_vector(15 downto 0);
        y:out std_logic_vector(31 downto 0));

end component;

signal inst3100: std_logic_vector( 31 downto 0 );
signal inst2500: std_logic_vector( 25 downto 0 );
signal inst3126: std_logic_vector( 5 downto 0 );
signal inst2521: std_logic_vector( 4 downto 0 );
signal inst2016: std_logic_vector( 4 downto 0 );
signal inst1511: std_logic_vector( 4 downto 0 );
signal inst1500: std_logic_vector( 15 downto 0 );
signal inst0500: std_logic_vector( 5 downto 0 );

signal RegDst: std_logic;
signal Jump: std_logic;
signal Branch: std_logic;
signal MemRead: std_logic;
signal MemtoReg: std_logic;
signal ALUOp: std_logic_vector( 1 downto 0 );
signal MemWrite: std_logic;
signal ALUSrc: std_logic;
signal RegWrite: std_logic;

signal A: std_logic_vector( 31 downto 0 ); --
signal B: std_logic_vector( 31 downto 0 );
signal C: std_logic_vector( 31 downto 0 ); --
signal D: std_logic_vector( 31 downto 0 ); --
signal E: std_logic_vector( 31 downto 0 ); --
signal F: std_logic_vector( 31 downto 0 ); --
signal G: std_logic_vector( 31 downto 0 ); --
signal H: std_logic_vector( 31 downto 0 ); --
--signal I: std_logic_vector( 31 downto 0 );
signal J: std_logic_vector( 31 downto 0 ); --
signal K: std_logic_vector( 31 downto 0 ); --
signal L: std_logic_vector( 31 downto 0 ); --
signal M: std_logic_vector( 31 downto 0 ); --
signal N: std_logic_vector( 31 downto 0 ); --
--signal O: std_logic_vector( 31 downto 0 );
signal P: std_logic_vector( 31 downto 0 ); --
signal Q: std_logic_vector( 31 downto 0 ); --
signal R: std_logic; --

signal Operation: std_logic_vector( 3 downto 0 );
signal Zero: std_logic;

PC1: PC port map(clk, P, A);

IMem: InstMemory port map(A, inst3100);
inst2500 <= inst3100( 25 downto 0 );
inst3126 <= inst3100( 31 downto 26 );
inst2521 <= inst3100( 25 downto 21 );
inst2016 <= inst3100( 20 downto 16 );
inst1511 <= inst3100( 15 downto 11 );
inst1500 <= inst3100( 15 downto 0 );
inst0500 <= inst3100( 5 downto 0 );

regmux: mux5 port map( inst2016, inst1511, J, RegDst, B);
reg: registers port map( inst2521, inst2016, B, J, RegWrite, C, D );

Cont: Control port map( inst3126, RegDst, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, Jump, ALUOp );

SignE: SignExtend port map( inst1500, E );

ALUMux: Mux32 port map( D, E, ALUSrc, F );
ALUCont: ALU_Control port map( ALUOp, inst0500, Operation );
ALU: ALU_nbit port map( C, F, Operation, G, Zero, open, Overflow );

DMem: DataMemory port map( D, G, MemRead, MemWrite, H );

JMux: Mux32 port map( H, G, MemtoReg, J );

4Add: ALU_nbit port map( A, "00000000000000000000000000000100", "0010", L, open, open, open );

SL2J: ShiftLeft2Jump port map( inst2500, L, Q );

SL2: ShiftLeft2 port map(E, K);

SLAdd: ALU_nbit port map( L, K, "0010", M, open, open, open );

RAnd: And2 port map( Branch, Zero, R );
JMux1: Mux32 port map( L, M, R, N );
JMux2: Mux32 port map( Q, N, Jump, P );

end struc;

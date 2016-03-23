library IEEE;
use IEEE.std_logic_1164.all;

entity EX is
port(
RSD  : in  STD_LOGIC_VECTOR (31 downto 0);
RTD   : in  STD_LOGIC_VECTOR (31 downto 0);
IMM   : in  STD_LOGIC_VECTOR (31 downto 0);


RDD   : out  STD_LOGIC_VECTOR (31 downto 0);
RDAI	: in STD_LOGIC_VECTOR (31 downto 0);
RDAO	: out STD_LOGIC_VECTOR (31 downto 0);

FCode: in std_logic_vector(3 downto 0);


PCEI: in std_logic_vector( 31 downto 0);
PCEO: out std_logic_vector(31 downto 0);

clock   : in  STD_LOGIC;

D1Sel1  : in  STD_LOGIC;
D1Sel0   : in  STD_LOGIC;

D2Sel0   : in  STD_LOGIC;
D2Sel1 : in  STD_LOGIC;

BE: in std_logic_vector(1 downto 0);
BT: out std_logic;

ZERO: out std_logic
);

end EX;

architecture foo of EX is 

component ALU is
port(
clock: in std_logic;
RS,RT: in std_logic_vector(31 downto 0);
FC: in std_logic_vector(3 downto 0);
RES: out std_logic_vector(31 downto 0) ;
ZERO: out std_logic);
end component;

component mux41 is
port(
SEL0 : in  STD_LOGIC;
    		SEL1 : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (31 downto 0);
           B   : in  STD_LOGIC_VECTOR (31 downto 0);
           C   : in  STD_LOGIC_VECTOR (31 downto 0);
           D   : in  STD_LOGIC_VECTOR (31 downto 0);
           X   : out STD_LOGIC_VECTOR (31 downto 0));
end component;





signal sclock: std_logic;
signal sRS: std_logic_vector(31 downto 0);
signal sRT: std_logic_vector(31 downto 0);
signal sRES: std_logic_vector(31 downto 0);
signal sFC: std_logic_vector(3 downto 0);
signal sZERO: std_logic;

signal SEL10: std_logic;
signal SEL11: std_logic;
signal SEL20: std_logic;
signal SEL21: std_logic;

signal A1: std_logic_vector(31 downto 0);
signal B1: std_logic_vector(31 downto 0);
signal C1: std_logic_vector(31 downto 0);
signal D1: std_logic_vector(31 downto 0);
signal X1: std_logic_vector(31 downto 0);

signal A2: std_logic_vector(31 downto 0);
signal B2: std_logic_vector(31 downto 0);
signal C2: std_logic_vector(31 downto 0);
signal D2: std_logic_vector(31 downto 0);
signal X2: std_logic_vector(31 downto 0);


begin
ALU1: ALU port map(sclock, sRS, sRT, sFC, sRES, sZERO);
mux1: mux41 port map(SEL10,SEL11,A1,B1,C1,D1,X1);
mux2: mux41 port map(SEL20, SEL21, A2, B2, C2, D2, X2);



RDAO<=RDAI;

--MUX 1
A1<= RSD;
B1<= PCEI;
C1<= (others => '0');
D1<= (others => '0');
SEL11<= D1Sel1;
SEL10<= D1Sel0;
sRS<=X1 ;

--MUX2
A2<= RTD;
B2<= IMM;
C2<= (others => '0');
D2<= (others => '0');
SEL21<= D2Sel1;
SEL20<= D2Sel0;
sRT<=X2 ;

--ALU1
sclock<= clock;
sFC<= FCode;
RDD<= sRES;
ZERO<=sZERO;


--BranchSelector



BT <= '1'  when BE = "01" and (RSD=RTD) else 
     '1' when BE = "10" and not (RSD=RTD) else 
     '1' when BE = "11" else
     '0';


end foo;



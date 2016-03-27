library IEEE;
use IEEE.std_logic_1164.all;

entity Proc is 
port ( 

clock: in std_logic;
inst : in std_logic_vector (31 downto 0);
we : in std_logic;
writeadd : in std_logic_vector(4 downto 0);
writedat : in std_logic_vector(31 downto 0);
resetn : in std_logic



RDD   : out  STD_LOGIC_VECTOR (31 downto 0);
RDAO	: out STD_LOGIC_VECTOR (4 downto 0);
PCEO: out std_logic_vector(31 downto 0);
BT: out std_logic;
MAO: out std_logic_vector(1 downto 0);
RAO: out std_logic_vector(1 downto 0);
ZERO: out std_logic

 ) ;
end entity ;

architecture arch of Proc is 

component IDSTAGEComp is
port(
 clk : in std_logic;
        instruction_in : in std_logic_vector (31 downto 0);

        write_enable : in std_logic;
        write_register_address : in std_logic_vector(4 downto 0);
        write_register_data : in std_logic_vector(31 downto 0);

        alu_op : out std_logic_vector (3 downto 0); -- ALU function code
        reg1_out : out std_logic_vector(31 downto 0) ; -- ALU first element
        reg2_out : out std_logic_vector(31 downto 0) ; -- ALU second element

        immediate_out : out std_logic_vector (31 downto 0); -- sign extended immediate value
        dest_register_address : out std_logic_vector (4 downto 0); -- destination register address for write back stage
        
        load : out std_logic; -- indicates if the mem stage should use the result of alu as address for load
        store : out std_logic; -- indicates if the mem stage should use the result of alu as address for store operation
        use_imm : out std_logic; -- indicate if alu should use value immediate for input 2
        use_pc : out std_logic; -- indicate if alu should use value of pc for input 1

        branch_ctl : out std_logic_vector(1 downto 0) ; -- control flow signal for taking branches and jumps
        n_reset : in std_logic

	);
end component;

component EXSTAGEcomp is
port(
RSD  : in  STD_LOGIC_VECTOR (31 downto 0);
RTD   : in  STD_LOGIC_VECTOR (31 downto 0);
IMM   : in  STD_LOGIC_VECTOR (31 downto 0);


RDD   : out  STD_LOGIC_VECTOR (31 downto 0);
RDAI	: in STD_LOGIC_VECTOR (4 downto 0);
RDAO	: out STD_LOGIC_VECTOR (4 downto 0);

FCode: in std_logic_vector(3 downto 0);


PCEI: in std_logic_vector(31 downto 0);
PCEO: out std_logic_vector(31 downto 0);

clock   : in  STD_LOGIC;

D1Sel1  : in  STD_LOGIC;
D1Sel0   : in  STD_LOGIC;

D2Sel0   : in  STD_LOGIC;
D2Sel1 : in  STD_LOGIC;

BE: in std_logic_vector(1 downto 0);
BT: out std_logic;
MAI: in std_logic_vector(1 downto 0);
MAO: out std_logic_vector(1 downto 0);

RAI: in std_logic_vector(1 downto 0);
RAO: out std_logic_vector(1 downto 0);

ZERO: out std_logic

	);
end component;


signal clk: std_logic;

-- IF/ID Pipeline Buffer

signal instBuffer: std_logic_vector (31 downto 0);
signal WEBuffer: std_logic;
signal WRABuffer: std_logic_vector (4 downto 0);
signal WRDBuffer: std_logic_vector(31 downto 0);
signal RSTBuffer: std_logic;


signal aluopBuffer: std_logic_vector( 31 downto 0);
signal R1Buffer: std_logic_vector( 31 downto 0);
signal R2Buffer: std_logic_vector( 31 downto 0);

signal IMBuffer: std_logic_vector( 31 downto 0);
signal RDADOBuffer: std_logic_vector( 31 downto 0);

signal ldBuffer: std_logic;
signal stBuffer: std_logic;
signal UIMMBuffer: std_logic;
signal UPCBuffer: std_logic;
signal BRBuffer: std_logic;

-- IF/ID Pipeline Buffer


--ID/ALU PipeLine Buffer

signal RSDBuffer: STD_LOGIC_VECTOR (31 downto 0);
signal RTDBuffer    : STD_LOGIC_VECTOR (31 downto 0);
signal IMMBuffer    : STD_LOGIC_VECTOR (31 downto 0);
signal RDDBuffer: : STD_LOGIC_VECTOR (31 downto 0);
signal RDAEOBuffer: sTD_LOGIC_VECTOR (4 downto 0);


signal RDAIBuffer 	:  STD_LOGIC_VECTOR (4 downto 0);

signal FCodeBuffer : std_logic_vector(3 downto 0);


signal PCEIBuffer : std_logic_vector(31 downto 0);
signal PCEOBuffer : std_logic_vector(31 downto 0);

signal D1Sel1Buffer   :  STD_LOGIC;
signal D1Sel0Buffer   : STD_LOGIC;

signal D2Sel0Buffer    : STD_LOGIC;
signal D2Sel1Buffer  : STD_LOGIC;
signal BTBuffer  : STD_LOGIC;

signal BEBuffer : std_logic_vector(1 downto 0);
signal MAIBuffer : std_logic_vector(1 downto 0);
signal MAOBuffer : std_logic_vector(1 downto 0);

signal RAIBuffer : std_logic_vector(1 downto 0);
signal RAOBuffer : std_logic_vector(1 downto 0);
signal ZEROBuffer : std_logic;


--ID/ALU PipeLine Buffer








begin 
IDSTAGE: IDSTAGEComp port map(clk,instBuffer,WEBuffer, WRABuffer,WRDBuffer,aluopBuffer,R1Buffer, R2Buffer, IMBuffer,RDADOBuffer, ldBuffer, stBuffer, UIMMBuffer,UPCBuffer,BRBuffer,RSTBuffer );
EXSTAGE: EXSTAGEcomp port map(RSDBuffer,RTDBuffer, IMMBuffer, RDDBuffer,RDAIBuffer,RDADOBuffer,FCodeBuffer,PCEIBuffer,PCEOBuffer,clk,D1Sel1Buffer,D1Sel0Buffer,D2Sel0Buffer,D2Sel1Buffer,BEBuffer,BTBuffer,MAIBuffer,MAOBuffer,RAIBuffer,RAOBuffer,ZEROBuffer)




end architecture ; -- arch





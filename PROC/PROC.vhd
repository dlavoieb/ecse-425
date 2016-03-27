library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.memory_arbiter_lib.all;

entity Proc is
port (
clock: in std_logic;
inst : in std_logic_vector (31 downto 0);
we : in std_logic;
writeadd : in std_logic_vector(reg_adrsize-1 downto 0);
writedat : in std_logic_vector(31 downto 0);
reset_n : in std_logic;

-- RDDO   : out  STD_LOGIC_VECTOR (31 downto 0);
-- RDAO	: out STD_LOGIC_VECTOR (reg_adrsize-1 downto 0);
register_access_out : out std_logic;
data_out : out std_logic_vector(31 downto 0);

PCEO: out std_logic_vector(31 downto 0);
BT: out std_logic;
ZEROEO: out std_logic
 ) ;
end entity ;

architecture arch of Proc is

component decode is
port(
  clk : in std_logic;
  instruction_in : in std_logic_vector (31 downto 0);

  write_enable : in std_logic;
  write_register_address : in std_logic_vector(reg_adrsize-1 downto 0);
  write_register_data : in std_logic_vector(31 downto 0);

  alu_op : out std_logic_vector (3 downto 0); -- ALU function code
  reg1_out : out std_logic_vector(31 downto 0) ; -- ALU first element
  reg2_out : out std_logic_vector(31 downto 0) ; -- ALU second element

  immediate_out : out std_logic_vector (31 downto 0); -- sign extended immediate value
  dest_register_address : out std_logic_vector (reg_adrsize-1 downto 0); -- destination register address for write back stage

  load : out std_logic; -- indicates if the mem stage should use the result of alu as address for load
  store : out std_logic; -- indicates if the mem stage should use the result of alu as address for store operation
  use_imm : out std_logic; -- indicate if alu should use value immediate for input 2
  use_pc : out std_logic; -- indicate if alu should use value of pc for input 1

  branch_ctl : out std_logic_vector(1 downto 0) ; -- control flow signal for taking branches and jumps
  n_reset : in std_logic

	);
end component;

component EX is
port(
  RSD  : in  STD_LOGIC_VECTOR (31 downto 0);
  RTD   : in  STD_LOGIC_VECTOR (31 downto 0);
  IMM   : in  STD_LOGIC_VECTOR (31 downto 0);

  RDD   : out  STD_LOGIC_VECTOR (31 downto 0);
  RDAI	: in STD_LOGIC_VECTOR (reg_adrsize-1 downto 0);
  RDAO	: out STD_LOGIC_VECTOR (reg_adrsize-1 downto 0);

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

  MAWI: in std_logic;
  MARI: in std_logic;

  MAWO: out std_logic;
  MARO: out std_logic;

  RA: out std_logic;

  ZERO: out std_logic
	);
end component;

component MEM is
  port(
  n_reset : in std_logic; -- Active low reset signal
  clk   : in  std_logic;  -- Clock signal
  data_in : inout  std_logic_vector (31 downto 0); --  Connects with RDD of EX
  add_in : in std_logic_vector(reg_adrsize-1 downto 0); --  Connects with RDAO of EX
  mem_access_read : in std_logic; -- Connects with MAO of EX
  mem_access_write : in std_logic;  -- Connects with RAO of EX
  register_access_in : in std_logic; -- Connects with register access of EX stage, gets passed through to reg_access_out

  register_access_out : out std_logic; -- Connects with register access in of WB stage
  data_out : out std_logic_vector(31 downto 0) -- Output of read data
  );
end component;


signal clk: std_logic;

-- IF/ID IN Pipeline Buffer

signal instBuffer: std_logic_vector (31 downto 0);
signal WEBuffer: std_logic;
signal WRABuffer: std_logic_vector (reg_adrsize-1 downto 0);
signal WRDBuffer: std_logic_vector(31 downto 0);
signal RSTBuffer: std_logic;

-- IF/ID IN Pipeline Buffer

--ID OUTPUT
signal alu_opO : std_logic_vector (3 downto 0);
signal reg1_outO : std_logic_vector(31 downto 0) ;
signal reg2_outO : std_logic_vector(31 downto 0) ;

signal immediate_outO : std_logic_vector (31 downto 0);
signal dest_register_addressO : std_logic_vector (reg_adrsize-1 downto 0);

signal loadO : std_logic;
signal storeO : std_logic;
signal use_immO : std_logic;
signal use_pcO : std_logic;

signal branch_ctlO : std_logic_vector(1 downto 0) ;


--ID/EX IN PipeLine Buffer

signal RSDBuffer: STD_LOGIC_VECTOR (31 downto 0);
signal RTDBuffer    : STD_LOGIC_VECTOR (31 downto 0);
signal IMMBuffer    : STD_LOGIC_VECTOR (31 downto 0);


signal RDAIBuffer 	:  STD_LOGIC_VECTOR (reg_adrsize-1 downto 0);

signal FCodeBuffer : std_logic_vector(3 downto 0);


signal PCEIBuffer : std_logic_vector(31 downto 0);
signal D1Sel1Buffer   :  STD_LOGIC;
signal D1Sel0Buffer   : STD_LOGIC;

signal D2Sel0Buffer    : STD_LOGIC;
signal D2Sel1Buffer  : STD_LOGIC;

signal BEBuffer : std_logic_vector(1 downto 0);
signal MAWIBuffer : std_logic;
signal MARIBuffer : std_logic;

--ID/EX PipeLine Buffer

--EX/MEM PipeLine Buffer - Includes EX output signals
--EX OUTPUT
signal RDDEO:STD_LOGIC_VECTOR (31 downto 0);
signal RDAOO :  STD_LOGIC_VECTOR (reg_adrsize-1 downto 0);
signal PCEIO : std_logic_vector(31 downto 0);
signal BTO: std_logic;
signal MAWO : std_logic;
signal MARO : std_logic;
signal RAO: std_logic;
signal ZEROO: std_logic;

-- MEM Output
signal data_in_Buffer : std_logic_vector (31 downto 0);--data_in
signal add_in_Buffer : std_logic_vector(reg_adrsize-1 downto 0);--add_in
signal mem_access_read_Buffer : std_logic;--mem_access_read
signal mem_access_write_Buffer : std_logic;--mem_access_write
signal register_access_in_Buffer : std_logic;--register_access_in

--------------------------------------------------------------------------------






begin
ID_STAGE: decode port map(
  clk,
  instBuffer,
  WEBuffer,
  WRABuffer,
  WRDBuffer,
  alu_opO,
  reg1_outO,
  reg2_outO,
  immediate_outO,
  dest_register_addressO,
  loadO,
  storeO,
  use_immO,
  use_pcO,
  branch_ctlO,
  RSTBuffer);

EX_STAGE: EX port map(
  RSDBuffer,
  RTDBuffer,
  IMMBuffer,
  RDDEO, --
  RDAIBuffer,
  RDAOO, --
  FCodeBuffer,
  PCEIBuffer,
  PCEIO, --
  clk,
  D1Sel1Buffer,
  D1Sel0Buffer,
  D2Sel0Buffer,
  D2Sel1Buffer,
  BEBuffer,
  BTO, --
  MAWIBuffer,
  MARIBuffer,
  MAWO,
  MARO,
  RAO, --
  ZEROO); --

MEM_STAGE: MEM port map(
  RSTBuffer,  --Why do we have a rst buffer ?
  clk,
  data_in_Buffer, --data_in
  add_in_Buffer, --add_in
  mem_access_read_Buffer, --mem_access_read
  mem_access_write_Buffer, --mem_access_write
  register_access_in_Buffer, --register_access_in
  register_access_out,
  data_out);


clk<=clock;
RSTBuffer<=reset_n;
D2Sel1Buffer<='0';
D1Sel1Buffer<='0';


proc: process (clock)
begin

if falling_edge(clock) then

--PROC OUTPUTS
-- RDDO<=RDDEO;
-- RDAO<=RDAOO;
-- RAEO<=RAO;
data_in_Buffer <= RDDEO;
add_in_Buffer <= RDAOO;

PCEO<=PCEIO;
BT<=BTO;
ZEROEO<=ZEROO;

register_access_in_Buffer <= RAO;
mem_access_read_Buffer <= MAWO;
mem_access_write_Buffer<= MARO;
-- MAWEO<= MAWOBuffer;
-- MAREO<=MAROBuffer;

--PROC INPUTS
instBuffer<=inst;
WEBuffer<=we;
WRABuffer<=writeadd;
WRDBuffer<=writedat;

--BUFFER LATCHING
FCodeBuffer<=alu_opO;
RSDBuffer<=reg1_outO;
RTDBuffer<=reg2_outO;
IMMBuffer<=immediate_outO;
RDAIBuffer<=dest_register_addressO;
MAWIBuffer<=loadO;
MARIBuffer<=storeO;
D2Sel0Buffer<=use_immO;
D1Sel0Buffer<=use_pcO;
BEBuffer<=branch_ctlO;


-- BTOBuffer <= BTO;


end if;



end process;

end architecture ; -- arch

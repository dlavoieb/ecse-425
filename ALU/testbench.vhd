-- Testbench for  gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component EX is
port(
RSD  : in  STD_LOGIC_VECTOR (31 downto 0);
RTD   : in  STD_LOGIC_VECTOR (31 downto 0);
IMM   : in  STD_LOGIC_VECTOR (31 downto 0);


RDD   : out  STD_LOGIC_VECTOR (31 downto 0);
RDAI    : in STD_LOGIC_VECTOR (31 downto 0);
RDAO    : out STD_LOGIC_VECTOR (31 downto 0);

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
end component;

signal aRSD  : STD_LOGIC_VECTOR (31 downto 0);
signal aRTD   : STD_LOGIC_VECTOR (31 downto 0);
signal aIMM   : STD_LOGIC_VECTOR (31 downto 0);


signal aRDD   :  STD_LOGIC_VECTOR (31 downto 0);
signal aRDAI    :  STD_LOGIC_VECTOR (31 downto 0);
signal aRDAO    : ] STD_LOGIC_VECTOR (31 downto 0);

signal aFCode:  std_logic_vector(3 downto 0);


signal aPCEI:  std_logic_vector( 31 downto 0);
signal aPCEO:  std_logic_vector(31 downto 0);

signal aclock   :  STD_LOGIC;

signal aD1Sel1  : STD_LOGIC;
signal aD1Sel0   :   STD_LOGIC;

signal aD2Sel0   :  STD_LOGIC;
signal aD2Sel1 :  STD_LOGIC;

signal aBE:  std_logic_vector(1 downto 0);
signal aBT: std_logic;

signal aZERO:  std_logic

CONSTANT clk_period : time := 1 ns;

begin

  -- Connect DUT
  DUT: EX port map(aRSD, aRTD, aIMM, aRDD, aRDAI, aRDAO, aFCode, aPCEO, aPCEI, aclock, aD2Sel1, aD2Sel0, aD1Sel0, aD1Sel1, aBT, aBE, aZERO);


  clk_process : PROCESS
BEGIN
  sclock <= '1';
  WAIT FOR clk_period/2;
  sclock <= '0';
  WAIT FOR clk_period/2;
END PROCESS;

  process
  begin
    
    aRSD <= (others => '0');
    aRTD <= (others => '0');
    aIMM <= (others => '0');

    aRDAI <= (others => '0');
        aFCode <= (others => '0');

    aPCEO <= (others => '0');
    aPCEI <= (others => '0');

    aclock <= sclock;

    aD2Sel1 <= (others => '0');
    aD2Sel0 <= (others => '0');

    aD1Sel1 <= (others => '0');
    aD1Sel0 <= (others => '0');

    aBT <= (others => '0');
    aBE <= (others => '0');

    aZERO <= (others => '0');


   
    wait for 1 ns;
   

   aRSD <= "00000000000000000000000000111000";
    aRTD <= "00000000000000100000001000111000";
    aIMM <= (others => '0');

    aRDD <= (others => '0');
    aRDAI <= (others => '0');
    aRDAO <= (others => '0');

    aFCode <= (others => '0');

    aPCEO <= (others => '0');
    aPCEI <= (others => '0');

    aclock <= sclock;

    aD2Sel1 <= (others => '0');
    aD2Sel0 <= (others => '0');

    aD1Sel1 <= (others => '0');
    aD1Sel0 <= (others => '0');

    aBT <= (others => '0');
    aBE <= (others => '0');

    aZERO <= (others => '0');
   
    wait for 1 ns;

 

    

    

      -- Clear inputs
   
    sRS <= (others => '0');
    sRT <= (others => '0');
    sFC <= (others => '0');

    wait;
  end process;
end tb;

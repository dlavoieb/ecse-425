-- Testbench for OR gate
library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component ALU is
port(
clock: in std_logic;
RS,RT: in std_logic_vector(31 downto 0);
FC: in std_logic_vector(3 downto 0);
RES: out std_logic_vector(31 downto 0) ;
ZERO: out std_logic);
end component;

signal sclock:  std_logic;
signal sRS,sRT: std_logic_vector(31 downto 0);
signal sFC: std_logic_vector(3 downto 0);
signal sRES: std_logic_vector(31 downto 0) ;
signal sZERO: std_logic;
signal st: integer;

CONSTANT clk_period : time := 1 ns;

begin

  -- Connect DUT
  DUT: ALU port map(sclock, sRS, sRT, sFC, sRES, sZERO);


  clk_process : PROCESS
BEGIN
  sclock <= '1';
  WAIT FOR clk_period/2;
  sclock <= '0';
  WAIT FOR clk_period/2;
END PROCESS;

  process
  begin
    
    sRS <= (others => '0');
    sRT <= (others => '0');
    sFC <= (others => '0');
   
    wait for 1 ns;
   
   ------------------MATH---------------------

    --add
    sRS <= "11111111111111111111111111110011"; 
    sRT <= "00000000000000000000000000000111";
    sFC <= "0000";
    st <=1;
   
    wait for 1 ns;

      --sub
    sRS <= "11111111111111111111111111110011";
    sRT <= "00000000000000000000000000000111";
    sFC <= "1110";
    st<=2;
   
    wait for 1 ns;

    --div
    sRS <= "11111111111111111111111110111111";
    sRT <= "00000000000000000000000000000111";
    sFC <= "0010";
    st<=3;

    wait for 1 ns;

    --load hi
    sRS <= "11111111111111111111111110111111";
    sRT <= "00000000000000000000000000000111";
    sFC <= "0101";
    st<=4;
   
    wait for 1 ns;

    --load lo
    sRS <= "11111111111111111111111110111111";
    sRT <= "00000000000000000000000000000111";
    sFC <= "0110";
    st<=5;
   
    wait for 1 ns;

    --mult
     sRS <= "11111111111111111111111111110011";
    sRT <= "00000000000000000000000000000111";
    sFC <= "0111";
    st<=6;
   
    wait for 1 ns;

    --load hi
     sRS <= "11111111111111111111111111110011";
    sRT <= "00000000000000000000000000000111";
    sFC <= "0101";
    st<=7;
   
    wait for 1 ns;

    --load lo
     sRS <= "11111111111111111111111111110011";
    sRT <= "00000000000000000000000000000111";
    sFC <= "0110";
    st<=8;
    wait for 1 ns;

    ------------------MATH---------------------

    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------

    ------------------LOGIC---------------------

    --and
    sRS <= "00000000000001000111101100100111";
    sRT <= "00000000000000000011001000000111";
    sFC <= "0001";
    st<=9;
   
    wait for 1 ns;

    --equals (FALSE)
    sRS <= "00000000000001000111101100100111";
    sRT <= "00000000000000000011001000000111";
    sFC <= "0011";
    st<=10;
   
    wait for 1 ns;

    --equals (TRUE)
    sRS <= "00000000000001000111101100100111";
    sRT <= "00000000000001000111101100100111";
    sFC <= "0011";
    st<=11;
   
    wait for 1 ns;

    --nor
    sRS <= "00000000000001000111101100100101";
    sRT <= "00000000000000000011001000000111";
    sFC <= "1000";
    st<=12;
   
    wait for 1 ns;

    --or
    sRS <= "00000000000001000111101100100101";
    sRT <= "00000000000000000011001000000111";
    sFC <= "1001";
    st<=13;

    wait for 1 ns;

    --xor
    sRS <= "00100000000001000111101100100101";
    sRT <= "00000001000000000011001000000111";
    sFC <= "1111";
    st<=14;
   
    wait for 1 ns;

    ------------------LOGIC---------------------

    -----------------------------------------------------------------------------------
    -----------------------------------------------------------------------------------

    ------------------SHIFTING------------------

    --lui
    sRS <= "00100000000001000111101100100101";
    sRT <= "00000001000000000011001000000111";
    sFC <= "0100";
    st<=15;
   
    wait for 1 ns;

    --sll
    sRS <= "00100000000001000111101100100101";
    sRT <= "00000000000000000000000000000111";
    sFC <= "1010";
    st<=16;
   
    wait for 1 ns;

    --slt (FALSE)
    sRS <= "00100000000001000111101100100101";
    sRT <= "00000001000000000011001000000111";
    sFC <= "1011";
    st<=17;
   
    wait for 1 ns;

    --slt (TRUE)
    sRS <= "00000000000001000111101100100101";
    sRT <= "01000001000000000011001000000111";
    sFC <= "1011";
    st<=18;

    wait for 1 ns;

    --sra (ZEROS)
    sRS <= "00100000000001000111101100100101";
    sRT <= "00000000000000000000000000000111";
    sFC <= "1100";
    st<=19;
   
    wait for 1 ns;

     --sra (ONES)
    sRS <= "10100000000001000111101100100101";
    sRT <= "00000000000000000000000000000111";
    sFC <= "1100";
    st<=20;
   
    wait for 1 ns;

    --srl (ZEROS)
    sRS <= "00100000000001000111101100100101";
    sRT <= "00000000000000000000000000000111";
    sFC <= "1101";
    st<=21;
   
    wait for 1 ns;

     --srl (ONES)
    sRS <= "10100000000001000111101100100101";
    sRT <= "00000000000000000000000000000111";
    sFC <= "1101";
    st<=22;
   
    wait for 1 ns;

    
    ------------------SHIFTING------------------
    

      -- Clear inputs
   
    sRS <= (others => '0');
    sRT <= (others => '0');
    sFC <= (others => '0');

    wait;
  end process;
end tb;

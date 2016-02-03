LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;

ENTITY fsm_tb IS
END fsm_tb;

ARCHITECTURE behaviour OF fsm_tb IS

COMPONENT comments_fsm IS
PORT (clk : in std_logic;
      reset : in std_logic;
      input : in std_logic_vector(7 downto 0);
      output : out std_logic
  );
END COMPONENT;

--The input signals with their initial values
SIGNAL clk, s_reset, s_output: STD_LOGIC := '0';
SIGNAL s_input: std_logic_vector(7 downto 0) := (others => '0');

CONSTANT clk_period : time := 1 ns;
CONSTANT SLASH_CHARACTER : std_logic_vector(7 downto 0) := "00101111";
CONSTANT STAR_CHARACTER : std_logic_vector(7 downto 0) := "00101010";
CONSTANT NEW_LINE_CHARACTER : std_logic_vector(7 downto 0) := "00001010";

BEGIN
dut: comments_fsm
PORT MAP(clk, s_reset, s_input, s_output);

 --clock process
clk_process : PROCESS
BEGIN
	clk <= '0';
	WAIT FOR clk_period/2;
	clk <= '1';
	WAIT FOR clk_period/2;
END PROCESS;
 
--TODO: Thoroughly test your FSM
stim_process: PROCESS
BEGIN    
	REPORT "Example case, reading a meaningless character";
	s_input <= "01011000";
	WAIT FOR 1 * clk_period;
	ASSERT (s_output = '0') REPORT "When reading a meaningless character, the output should be '0'" SEVERITY ERROR;
	REPORT "_______________________";
    
    --"abc\n"

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01001001";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000111";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01001001";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000111";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00111100";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "00111110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00111100";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "00111110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100010";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01000011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "00100010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00111100";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01000011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "00111110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011100";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110001";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110001";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01011011";
wait for 1 * clk_period;

s_input <= "00110100";
wait for 1 * clk_period;

s_input <= "01011101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "00110001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00101101";
wait for 1 * clk_period;

s_input <= "00110111";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "00110001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00101101";
wait for 1 * clk_period;

s_input <= "00110111";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01010110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "01011011";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "01011101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00111000";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01000110";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00111000";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000111";
wait for 1 * clk_period;

s_input <= "01010000";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "00110001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00101101";
wait for 1 * clk_period;

s_input <= "00110101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01010100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01000100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000111";
wait for 1 * clk_period;

s_input <= "01010000";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "00110010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01000100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01011011";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "01011101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "01011011";
wait for 1 * clk_period;

s_input <= "00110011";
wait for 1 * clk_period;

s_input <= "01011101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01111101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011100";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01001001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "00111010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011100";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010000";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00111101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00110000";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011100";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01101010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01101010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01010100";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101101";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01111001";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101011";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01000011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01011100";
wait for 1 * clk_period;

s_input <= "01100010";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "00101110";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101010";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01110110";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01110101";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01111110";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01110000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01101111";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100011";
wait for 1 * clk_period;

s_input <= "01110100";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "00111010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00101000";
wait for 1 * clk_period;

s_input <= "00101001";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01111101";
wait for 1 * clk_period;

s_input <= "00111011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01111101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101000";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01110011";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "01111101";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "01101100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "01100001";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100111";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01110010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;

s_input <= "00100011";
wait for 1 * clk_period;

s_input <= "01100101";
wait for 1 * clk_period;

s_input <= "01101110";
wait for 1 * clk_period;

s_input <= "01100100";
wait for 1 * clk_period;

s_input <= "01101001";
wait for 1 * clk_period;

s_input <= "01100110";
wait for 1 * clk_period;

s_input <= "00100000";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "00101111";
wait for 1 * clk_period;

s_input <= "01001100";
wait for 1 * clk_period;

s_input <= "01001001";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001110";
wait for 1 * clk_period;

s_input <= "01000111";
wait for 1 * clk_period;

s_input <= "01000101";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01000001";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "01010010";
wait for 1 * clk_period;

s_input <= "01010011";
wait for 1 * clk_period;

s_input <= "01011111";
wait for 1 * clk_period;

s_input <= "01001000";
wait for 1 * clk_period;

s_input <= "00001010";
wait for 1 * clk_period;



	WAIT;
END PROCESS stim_process;
END;

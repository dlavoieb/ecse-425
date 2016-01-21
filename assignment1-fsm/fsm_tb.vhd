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

    s_input <= "01100001";
    wait for 1 * clk_period;

    s_input <= "01100010";
    wait for 1 * clk_period;

    s_input <= "01100011";
    wait for 1 * clk_period;

    s_input <= "00001010";
    wait for 1 * clk_period;

    -- "//abc\n"

    s_input <= "00101111";
    wait for 1 * clk_period;

    s_input <= "00101111";
    wait for 1 * clk_period;

    s_input <= "01100001";
    wait for 1 * clk_period;

    s_input <= "01100010";
    wait for 1 * clk_period;

    s_input <= "01100011";
    wait for 1 * clk_period;

    s_input <= "00001010";
    wait for 1 * clk_period;

    --abc

    s_input <= "1100001";
    wait for 1 * clk_period;

    s_input <= "1100010";
    wait for 1 * clk_period;

    s_input <= "1100011";
    wait for 1 * clk_period;

    s_input <= "1010";
    wait for 1 * clk_period;

    --/*abc*/

    s_input <= "101111";
    wait for 1 * clk_period;

    s_input <= "101010";
    wait for 1 * clk_period;

    s_input <= "1100001";
    wait for 1 * clk_period;

    s_input <= "1100010";
    wait for 1 * clk_period;

    s_input <= "1100011";
    wait for 1 * clk_period;

    s_input <= "101010";
    wait for 1 * clk_period;

    s_input <= "101111";
    wait for 1 * clk_period;

    s_input <= "1010";
    wait for 1 * clk_period;

    --abc

    s_input <= "1100001";
    wait for 1 * clk_period;

    s_input <= "1100010";
    wait for 1 * clk_period;

    s_input <= "1100011";
    wait for 1 * clk_period;

    s_input <= "1010";
    wait for 1 * clk_period;

    --/*abc/abc*/

    s_input <= "101111";
    wait for 1 * clk_period;

    s_input <= "101010";
    wait for 1 * clk_period;

    s_input <= "1100001";
    wait for 1 * clk_period;

    s_input <= "1100010";
    wait for 1 * clk_period;

    s_input <= "1100011";
    wait for 1 * clk_period;

    s_input <= "101111";
    wait for 1 * clk_period;

    s_input <= "1100001";
    wait for 1 * clk_period;

    s_input <= "1100010";
    wait for 1 * clk_period;

    s_input <= "1100011";
    wait for 1 * clk_period;

    s_input <= "101010";
    wait for 1 * clk_period;

    s_input <= "101111";
    wait for 1 * clk_period;

    s_input <= "1010";
    wait for 1 * clk_period;
    
	WAIT;
END PROCESS stim_process;
END;

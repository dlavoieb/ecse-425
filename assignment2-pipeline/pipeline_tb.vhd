LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

ENTITY pipeline_tb IS
END pipeline_tb;

ARCHITECTURE behaviour OF pipeline_tb IS

COMPONENT pipeline IS
port (clk : in std_logic;
      a, b, c, d, e : in integer;
      op1, op2, op3, op4, op5, final_output : out integer;
  );
END COMPONENT;

--The input signals with their initial values
SIGNAL clk: STD_LOGIC := '0';
SIGNAL s_a, s_b, s_c, s_d, s_e : INTEGER := 0;
SIGNAL s_op1, s_op2, s_op3, s_op4, s_op5, s_final_output : INTEGER := 0;

CONSTANT clk_period : time := 1 ns;

BEGIN
dut: pipeline
PORT MAP(clk, s_a, s_b, s_c, s_d, s_e, s_op1, s_op2, s_op3, s_op4, s_op5, s_final_output);

 --clock process
clk_process : PROCESS
BEGIN
	clk <= '1';
	WAIT FOR clk_period/2;
	clk <= '0';
	WAIT FOR clk_period/2;
END PROCESS; 

stim_process: PROCESS
BEGIN   
    wait for clk_period/2;

    s_a <= 1;
    s_b <= 2;
    s_c <= 3;
    s_d <= 4;
    s_e <= 5;

    WAIT FOR 1 * clk_period;
    ASSERT(s_op1 = 1) REPORT "" SEVERITY ERROR;
    ASSERT(s_op2 = 0) REPORT "" SEVERITY ERROR;
    ASSERT(s_op3 = 0) REPORT "" SEVERITY ERROR;
    ASSERT(s_op4 = 0) REPORT "" SEVERITY ERROR;
    ASSERT(s_op5 = 0) REPORT "" SEVERITY ERROR;
    ASSERT(s_final_output = 0) REPORT "" SEVERITY ERROR;

	--TODO: Stimulate the inputs for the pipelined equation ((a + b) * 42) - (c * d * (a - e)) and assert the results
	WAIT;
END PROCESS stim_process;
END;

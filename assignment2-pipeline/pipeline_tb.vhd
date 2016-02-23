LIBRARY ieee;
USE ieee.STD_LOGIC_1164.all;
use ieee.numeric_std.all;

ENTITY pipeline_tb IS
END pipeline_tb;

ARCHITECTURE behaviour OF pipeline_tb IS

COMPONENT pipeline IS
port (clk : in std_logic;
      a, b, c, d, e : in integer;
      op1, op2, op3, op4, op5, final_output : out integer
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

    -- Main body generated with script (sorry for formatting)
    -- Tests pipeline with inputs held fixed for the entire 3 cycles
    -- Then tests clearing the pipeline (inputs at 0)
    -- Then tests two scenarios of changing inputs between stages
    -- Total simulation length : 20ns

    REPORT "Simple static test";
    s_a <= 1;
    s_b <= 2;
    s_c <= 3;
    s_d <= 4;
    s_e <= 5;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 0" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 1" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 2" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 3" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 4" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 5" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 6" SEVERITY ERROR;
    ASSERT (s_op2 = 126) REPORT "Error at assert 7" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 8" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 9" SEVERITY ERROR;
    ASSERT (s_op5 = -48) REPORT "Error at assert 10" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 11" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 12" SEVERITY ERROR;
    ASSERT (s_op2 = 126) REPORT "Error at assert 13" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 14" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 15" SEVERITY ERROR;
    ASSERT (s_op5 = -48) REPORT "Error at assert 16" SEVERITY ERROR;
    ASSERT (s_final_output = 174) REPORT "Error at assert 17" SEVERITY ERROR;
    REPORT "Reseting Pipeline";
    s_a <= 0;
    s_b <= 0;
    s_c <= 0;
    s_d <= 0;
    s_e <= 0;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 18" SEVERITY ERROR;
    ASSERT (s_op2 = 126) REPORT "Error at assert 19" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 20" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 21" SEVERITY ERROR;
    ASSERT (s_op5 = -48) REPORT "Error at assert 22" SEVERITY ERROR;
    ASSERT (s_final_output = 174) REPORT "Error at assert 23" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 24" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 25" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 26" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 27" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 28" SEVERITY ERROR;
    ASSERT (s_final_output = 174) REPORT "Error at assert 29" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 30" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 31" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 32" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 33" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 34" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 35" SEVERITY ERROR;
    REPORT "Test with changing inputs";
    s_a <= 3;
    s_b <= 3;
    s_c <= 3;
    s_d <= 3;
    s_e <= 3;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 6) REPORT "Error at assert 36" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 37" SEVERITY ERROR;
    ASSERT (s_op3 = 9) REPORT "Error at assert 38" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 39" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 40" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 41" SEVERITY ERROR;
    s_a <= 5;
    s_b <= 5;
    s_c <= 5;
    s_d <= 5;
    s_e <= 5;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 10) REPORT "Error at assert 42" SEVERITY ERROR;
    ASSERT (s_op2 = 252) REPORT "Error at assert 43" SEVERITY ERROR;
    ASSERT (s_op3 = 25) REPORT "Error at assert 44" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 45" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 46" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 47" SEVERITY ERROR;
    s_a <= 3;
    s_b <= 5;
    s_c <= 3;
    s_d <= 5;
    s_e <= 5;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 8) REPORT "Error at assert 48" SEVERITY ERROR;
    ASSERT (s_op2 = 420) REPORT "Error at assert 49" SEVERITY ERROR;
    ASSERT (s_op3 = 15) REPORT "Error at assert 50" SEVERITY ERROR;
    ASSERT (s_op4 = -2) REPORT "Error at assert 51" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 52" SEVERITY ERROR;
    ASSERT (s_final_output = 252) REPORT "Error at assert 53" SEVERITY ERROR;
    s_a <= 0;
    s_b <= 0;
    s_c <= 0;
    s_d <= 0;
    s_e <= 0;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 54" SEVERITY ERROR;
    ASSERT (s_op2 = 336) REPORT "Error at assert 55" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 56" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 57" SEVERITY ERROR;
    ASSERT (s_op5 = -30) REPORT "Error at assert 58" SEVERITY ERROR;
    ASSERT (s_final_output = 420) REPORT "Error at assert 59" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 60" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 61" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 62" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 63" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 64" SEVERITY ERROR;
    ASSERT (s_final_output = 366) REPORT "Error at assert 65" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 66" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 67" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 68" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 69" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 70" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 71" SEVERITY ERROR;
    s_a <= 1;
    s_b <= 2;
    s_c <= 3;
    s_d <= 4;
    s_e <= 5;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 72" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 73" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 74" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 75" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 76" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 77" SEVERITY ERROR;
    s_a <= 0;
    s_b <= 0;
    s_c <= 0;
    s_d <= 0;
    s_e <= 0;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 0) REPORT "Error at assert 78" SEVERITY ERROR;
    ASSERT (s_op2 = 126) REPORT "Error at assert 79" SEVERITY ERROR;
    ASSERT (s_op3 = 0) REPORT "Error at assert 80" SEVERITY ERROR;
    ASSERT (s_op4 = 0) REPORT "Error at assert 81" SEVERITY ERROR;
    ASSERT (s_op5 = -48) REPORT "Error at assert 82" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 83" SEVERITY ERROR;
    s_a <= 1;
    s_b <= 2;
    s_c <= 3;
    s_d <= 4;
    s_e <= 5;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 84" SEVERITY ERROR;
    ASSERT (s_op2 = 0) REPORT "Error at assert 85" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 86" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 87" SEVERITY ERROR;
    ASSERT (s_op5 = 0) REPORT "Error at assert 88" SEVERITY ERROR;
    ASSERT (s_final_output = 174) REPORT "Error at assert 89" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 90" SEVERITY ERROR;
    ASSERT (s_op2 = 126) REPORT "Error at assert 91" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 92" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 93" SEVERITY ERROR;
    ASSERT (s_op5 = -48) REPORT "Error at assert 94" SEVERITY ERROR;
    ASSERT (s_final_output = 0) REPORT "Error at assert 95" SEVERITY ERROR;
    wait for 1 * clk_period;
    ASSERT (s_op1 = 3) REPORT "Error at assert 96" SEVERITY ERROR;
    ASSERT (s_op2 = 126) REPORT "Error at assert 97" SEVERITY ERROR;
    ASSERT (s_op3 = 12) REPORT "Error at assert 98" SEVERITY ERROR;
    ASSERT (s_op4 = -4) REPORT "Error at assert 99" SEVERITY ERROR;
    ASSERT (s_op5 = -48) REPORT "Error at assert 100" SEVERITY ERROR;
    ASSERT (s_final_output = 174) REPORT "Error at assert 101" SEVERITY ERROR;

    WAIT;
END PROCESS stim_process;
END;

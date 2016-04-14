library ieee;
use IEEE.std_logic_1164.all;

entity predictor_1bit is
  port (
	pc_in : in std_logic_vector(31 downto 0);

	branch_target : in std_logic_vector(31 downto 0) ;
	branch_taken : in std_logic;
	branch_ctl : in std_logic_vector(1 downto 0) ;

	pc_target : out std_logic_vector(31 downto 0);
	prediction : out std_logic;
	clk : in std_logic
  ) ;
end entity ; -- predictor_1bit

architecture arch of predictor_1bit is

signal branch_instruction_pc : std_logic_vector(31 downto 0) := (others => '0');
signal branch_target_pc : std_logic_vector(31 downto 0) := (others => '0') ;
signal taken : std_logic  := '0';
signal prediction_internal : std_logic;

begin

pc_target <= branch_target_pc;
prediction <= prediction_internal;

do_prediction : process( pc_in )
begin
	prediction_internal <= '0';
	if pc_in = branch_instruction_pc then
		if taken = '1' then
			prediction_internal <= '1';
		end if ;
	end if ;
end process ; -- prediction

learn_new : process( clk )
begin
	if rising_edge(clk) then
		if (branch_ctl = "10") or (branch_ctl = "01") then
			if branch_instruction_pc /= pc_in then
				taken <= branch_taken;
				branch_instruction_pc <= pc_in;
				branch_target_pc <= branch_target;
			end if ;
		end if ;
	end if ;
end process ; -- learn_new

end architecture ; -- arch

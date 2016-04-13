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
	bad_prediction : out std_logic;
	clk : in std_logic
  ) ;
end entity ; -- predictor_1bit

architecture arch of predictor_1bit is

signal branch_instruction_pc : std_logic_vector(31 downto 0) := (others => '0');
signal branch_target_pc : std_logic_vector(31 downto 0) := (others => '0') ;
signal taken : std_logic  := '0';

type States is (p00, p01, p10, p11);
signal state : States;

begin

pc_target <= branch_target_pc;

do_prediction : process( pc_in )
begin
	prediction <= '0';
	if pc_in = branch_instruction_pc then
		if taken = '1' then
			prediction <= '1';
		end if ;
	end if ;
end process ; -- prediction

learn_new : process( clk )
begin
	if rising_edge(clk) then
		if (branch_ctl = "10") or (branch_ctl = "01") then
			if pc_in = branch_instruction_pc then
				
				case( state ) is
				
					when p00 =>
						if branch_taken = '1' then
							state <= p01;
						else
							state <= p00;
						end if ;
					when p01 =>
						if branch_taken = '1' then
							state <= p11;
						else 
							state <= p00;
						end if ;
					when p10 =>
						if branch_taken = '1' then
							state <= p11;
						else 
							state <= p00;
						end if ;
					when p11 =>
						if branch_taken = '1' then
							state <= p11;
						else 
							state <= p10;
						end if ;
						
					when others =>
						NULL;
				end case ;

			else 
				state <= p00;

			end if ;
		
		end if ;
	end if ;
end process ; -- learn_new

state_change : process( state )
begin
	case( state ) is
	
		when p00 =>
			taken <= '0';
		when p01 =>
			taken <= '0';
		when p10 =>
			taken <= '1';
		when p11 =>
			taken <= '1';
		when others =>
			taken <= '0';
		
	end case ;
end process ; -- state_change

end architecture ; -- arch

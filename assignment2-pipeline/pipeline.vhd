library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipeline is
port (clk : in std_logic;
      a, b, c, d, e : in integer;
      op1, op2, op3, op4, op5, final_output : out integer
  );
end pipeline;

architecture behavioral of pipeline is
    variable op1_internal, 
           op2_internal, 
           op3_internal, 
           op4_internal, 
           op5_internal: integer := 0;
begin

--process (clk, a, b, c, d, e)
--begin
--    if rising_edge(clk) then
--        op1_internal := a + b;
--        op2_internal := op1_internal * 42;
--        op3_internal := c * d;
--        op4_internal := a - e;
--        op5_internal := op3_internal * op4_internal;          

--        op1 <= op1_internal;
--        op2 <= op2_internal;
--        op3 <= op3_internal;
--        op4 <= op4_internal;
--        op5 <= op5_internal;
--        final_output <= op2_internal - op5_internal;

--    end if ; -- rising_edge(clk)
--end process;

op1 : process( clk )
begin
    if rising_edge(clk) then
        op1_internal := a + b;
        op1 <= op1_internal; 
    end if ; -- rising_edge(clk)
end process ; -- op1

op2 : process( op1, clk )
begin
    op2_internal := op1_internal * 42;
    if rising_edge(clk) then
        op2 <= op2_internal;
    end if ;
end process ; -- op2

end behavioral;
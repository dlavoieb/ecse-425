library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipeline is
port (clk : in std_logic;
      a, b, c, d, e : in integer;
      op1, op2, op3, op4, op5, final_output : out integer;
      step_out : out integer
  );
end pipeline;

architecture behavioral of pipeline is
    signal op1_internal, 
           op2_internal, 
           op3_internal, 
           op4_internal, 
           op5_internal, final_internal: integer := 0;
    signal step : integer := 0;
begin
process (clk)
begin
    if a'event then
        step <= 0;
    end if ;

    if rising_edge(clk) then
        case( step ) is
            when 0 =>
                op1_internal <= a + b;
            when 1 =>
                op2_internal <= op1_internal * 42;
            when 2=>
                op3_internal <= c * d;
            when 3=>
                op4_internal <= a - e;
            when 4=>
                op5_internal <= op3_internal * op4_internal; 
            when 5 =>
                final_internal <= op2_internal - op5_internal; 
            when others => null;
                end case ;         
        step <= (step + 1) mod 6;
    end if ; -- rising_edge(clk)
end process;

op1 <= op1_internal;
op2 <= op2_internal;
op3 <= op3_internal;
op4 <= op4_internal;
op5 <= op5_internal;
final_output <= final_internal;
step_out <= step;

end behavioral;
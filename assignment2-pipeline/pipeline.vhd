library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity pipeline is
port (clk : in std_logic;
      a, b, c, d, e : in integer;
      op1, op2, op3, op4, op5, final_output : out integer;
  );
end pipeline;

architecture behavioral of pipeline is
    signal op1_internal, 
           op2_internal, 
           op3_internal, 
           op4_internal, 
           op5_internal, final_internal: integer := 0;
begin
process (clk)
begin
    if rising_edge(clk) then
        pipeline_loop : for i in 0 to 2 loop
          case( i ) is
          
            when 0 =>
                op1_internal <= a + b;
                op3_internal <= c * d;
                op4_internal <= a - e;
            when 1 =>
                op2_internal <= op1_internal * 42;
                op5_internal <= op3_internal * op4_internal; 
            when 2 =>
                final_internal <= op2_internal - op5_internal;           
            when others =>
                null;          
          end case ;
        end loop ; -- pipeline_loop

    end if ; -- rising_edge(clk)
end process;

op1 <= op1_internal;
op2 <= op2_internal;
op3 <= op3_internal;
op4 <= op4_internal;
op5 <= op5_internal;
final_output <= final_internal;

end behavioral;
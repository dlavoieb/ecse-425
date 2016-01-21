library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

-- Do not modify the port map of this structure
entity comments_fsm is
port (clk : in std_logic;
      reset : in std_logic;
      input : in std_logic_vector(7 downto 0);
      output : out std_logic
  );
end comments_fsm;

architecture behavioral of comments_fsm is

-- The ASCII value for the '/', '*' and end-of-line characters
constant SLASH_CHARACTER : std_logic_vector(7 downto 0) := "00101111";
constant STAR_CHARACTER : std_logic_vector(7 downto 0) := "00101010";
constant NEW_LINE_CHARACTER : std_logic_vector(7 downto 0) := "00001010";

type States is (A, B, C, D, E);
signal state : States;

begin

-- Insert your processes here
process (clk, reset)
    begin
    if reset = '1' then
        state <= A;
    else
        case( state ) is
        
            when A =>
                if input = SLASH_CHARACTER then
                    state <= B;
                end if ;
            when B =>
                if input = SLASH_CHARACTER then
                    state <= C;
                elsif input = STAR_CHARACTER then
                    state <= D;
                else
                    state <= A;
                end if ;
            when C =>
                if input = NEW_LINE_CHARACTER then
                    state <= A;
                end if ;
            when D =>
                if input = STAR_CHARACTER then
                    state <= E;
                end if ;
            when E =>
                if input = SLASH_CHARACTER then
                    state <= A;
                else
                    state <= D;
                end if ;
    
            when others =>
                state <= A;    
        end case ;
    end if ;
end process;


controller : process( state )
begin
    if (state = C or state = D or state = E) then
        output <= '1';
    else
        output <= '0';
    end if ;
end process ; -- controller

end behavioral;
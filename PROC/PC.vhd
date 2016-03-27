library ieee;
use IEEE.std_logic_1164.all;

entity PC is
  port (
    clock : in std_logic;
    n_rst : in std_logic;
    pc_in : in std_logic_vector(31 downto 0);
    pc_out : out std_logic_vector(31 downto 0);
    enable : in std_logic
  ) ;
end entity ; -- PC

architecture arch of PC is
begin

program_counter : process( clock )
variable temp : std_logic_vector(31 downto 0);
begin

    if n_rst = '0' then
        temp := (OTHERS => '0');
    elsif rising_edge(clock) and enable = '1' then
        temp := pc_in;
    end if ;
    pc_out <= temp;
end process ; -- program_counter
end architecture ; -- arch

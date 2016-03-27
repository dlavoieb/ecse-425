library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux41 is
    Port ( SEL0 : in  STD_LOGIC;
    		SEL1 : in  STD_LOGIC;
           A   : in  STD_LOGIC_VECTOR (31 downto 0);
           B   : in  STD_LOGIC_VECTOR (31 downto 0);
           C   : in  STD_LOGIC_VECTOR (31 downto 0);
           D   : in  STD_LOGIC_VECTOR (31 downto 0);
           X   : out STD_LOGIC_VECTOR (31 downto 0));
end mux41;

architecture Behavioral of mux41 is
begin
    X <= 
    A when (SEL1= '0' AND SEL0= '0') else
    B when (SEL1= '0' AND SEL0= '1') else
    C when (SEL1= '1' AND SEL0= '0') else
    D when (SEL1= '1' AND SEL0= '1') else
    (others => '0');
end Behavioral;
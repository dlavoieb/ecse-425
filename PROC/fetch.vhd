library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.memory_arbiter_lib.all;

entity fetch is
  port (
    clk : in std_logic;
    pc_out : out std_logic_vector (31 downto 0);
    pc_in : in std_logic_vector (31 downto 0);
    pc_sel : in std_logic;
    instruction_out : out std_logic_vector (MEM_DATA_WIDTH-1 downto 0);
    n_reset : in std_logic
  ) ;
end entity ; -- fetch

architecture arch of fetch is

    SIGNAL im_address     : NATURAL                                       := 0;
    SIGNAL im_we          : STD_LOGIC                                     := '0';
    SIGNAL im_wr_done     : STD_LOGIC                                     := '0';
    SIGNAL im_re          : STD_LOGIC                                     := '0';
    SIGNAL im_rd_ready    : STD_LOGIC                                     := '0';
    SIGNAL im_data        : STD_LOGIC_VECTOR(MEM_DATA_WIDTH-1 downto 0)   := (others => 'Z');
    SIGNAL im_initialize  : STD_LOGIC                                     := '0';

    SIGNAL pc_int : std_logic_vector(31 downto 0) := (others => '0') ;
    SIGNAL pc_out_internal : std_logic_vector(31 downto 0) := (others => '0') ;

begin
    instruction_memory : ENTITY work.Main_Memory
    GENERIC MAP (
        Num_Bytes_in_Word   => NUM_BYTES_IN_WORD,
        Num_Bits_in_Byte    => NUM_BITS_IN_BYTE,
        Read_Delay          => 0,
        Write_Delay         => 0
    )
    PORT MAP (
        clk         => clk,
        address     => im_address,
        Word_Byte   => '1',
        we          => im_we,
        wr_done     => im_wr_done,
        re          => im_re,
        rd_ready    => im_rd_ready,
        data        => im_data,
        initialize  => im_initialize,
        dump        => '0'
    );

    program_counter : ENTITY work.PC
    PORT MAP (
        clock   => clk,
        n_rst   => n_reset,
        pc_in   => pc_out_internal,
        pc_out  => pc_int,
        enable  => '1'
    );

    im_address <= to_integer(unsigned(pc_int));
    im_we <= '0';
    im_wr_done <= 'Z';
    instruction_out <= im_data;
    im_re <= '1';

    fetch_cycle : process( clk )
    begin
        if rising_edge(clk) then
            if pc_sel = '1' then
                pc_out_internal <= pc_in;
            else
                pc_out_internal <= std_logic_vector(unsigned(pc_int) + 4);
            end if ;
        end if ;
    end process ; -- fetch_cycle
end architecture ; -- arch

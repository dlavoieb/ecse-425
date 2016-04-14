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
    pc_enable : in std_logic;
    instruction_out : out std_logic_vector (MEM_DATA_WIDTH-1 downto 0);
    n_reset : in std_logic;
    branch_ctl : in std_logic_vector(1 downto 0);
    predictor_taken_out : out std_logic
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

    SIGNAL selected_address : std_logic_vector(31 downto 0) := (others => '0') ;
    SIGNAL pc_out_internal : std_logic_vector(31 downto 0) := (others => '0') ;
    SIGNAL pc_out_internal_selected : std_logic_vector(31 downto 0) := (others => '0') ;

    signal predictor_target : std_logic_vector(31 downto 0) ;   
    signal predictor_taken : std_logic;
    signal last_cycle_prediction : std_logic;
    signal pc_sel_concat : std_logic_vector(1 downto 0);

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
        re          => pc_enable,
        rd_ready    => im_rd_ready,
        data        => im_data,
        initialize  => im_initialize,
        dump        => '0'
    );

    program_counter : ENTITY work.PC
    PORT MAP (
        clock   => clk,
        n_rst   => n_reset,
        pc_in   => selected_address,
        pc_out  => pc_out_internal,
        enable  => pc_enable
    );

    predictor_1 : ENTITY work.predictor_1bit
    PORT MAP (
        pc_in => pc_out_internal,
        branch_target => pc_in,
        branch_taken => pc_sel,
        branch_ctl => branch_ctl,
        pc_target => predictor_target,
        prediction  => predictor_taken,
        clk => clk
    );
    register_predictor : process( clk )
    begin
        if falling_edge(clk) then
            last_cycle_prediction <= predictor_taken;
        end if ;
    end process ; -- register_predictor

    pc_sel_concat <= pc_sel & last_cycle_prediction;
    predictor_taken_out <= predictor_taken;

    with pc_sel_concat select selected_address <= 
        pc_in when "10",
        pc_in when "01",
        std_logic_vector(unsigned(pc_out_internal_selected) + 4) when others;

    with predictor_taken select pc_out_internal_selected <=
        predictor_target when '1',
        pc_out_internal when others;

    pc_out <= pc_out_internal_selected;
    im_address <= to_integer(unsigned(pc_out_internal_selected));
    im_we <= '0';
    im_wr_done <= 'Z';
    instruction_out <= im_data;
    im_re <= '1';

end architecture ; -- arch

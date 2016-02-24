library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

use work.memory_arbiter_lib.all;

-- Do not modify the port map of this structure
entity memory_arbiter is
port (  clk   : in STD_LOGIC;
        reset : in STD_LOGIC;
      
        --Memory port #1
        addr1   : in NATURAL;
        data1   : inout STD_LOGIC_VECTOR(MEM_DATA_WIDTH-1 downto 0);
        re1     : in STD_LOGIC;
        we1     : in STD_LOGIC;
        busy1   : out STD_LOGIC;
        
        --Memory port #2
        addr2   : in NATURAL;
        data2   : inout STD_LOGIC_VECTOR(MEM_DATA_WIDTH-1 downto 0);
        re2     : in STD_LOGIC;
        we2     : in STD_LOGIC;
        busy2   : out STD_LOGIC
    );
end memory_arbiter;

architecture behavioral of memory_arbiter is

    --Main memory signals
    --Use these internal signals to interact with the main memory
    SIGNAL mm_address     : NATURAL                                       := 0;
    SIGNAL mm_we          : STD_LOGIC                                     := '0';
    SIGNAL mm_wr_done     : STD_LOGIC                                     := '0';
    SIGNAL mm_re          : STD_LOGIC                                     := '0';
    SIGNAL mm_rd_ready    : STD_LOGIC                                     := '0';
    SIGNAL mm_data        : STD_LOGIC_VECTOR(MEM_DATA_WIDTH-1 downto 0)   := (others => 'Z');
    SIGNAL mm_initialize  : STD_LOGIC                                     := '0';

    SIGNAL ch1_processing, ch1_done : STD_LOGIC := '0';
    SIGNAL ch2_processing, ch2_done : STD_LOGIC := '0';

    type States is (NO, R1, R2, W1, W2);
    signal state : States;
    signal next_state : States;

begin
    --Instantiation of the main memory component (DO NOT MODIFY)
    main_memory : ENTITY work.Main_Memory
      GENERIC MAP (
        Num_Bytes_in_Word   => NUM_BYTES_IN_WORD,
        Num_Bits_in_Byte    => NUM_BITS_IN_BYTE,
        Read_Delay          => 3, 
        Write_Delay         => 3
      )
      PORT MAP (
        clk         => clk,
        address     => mm_address,
        Word_Byte   => '1',
        we          => mm_we,
        wr_done     => mm_wr_done,
        re          => mm_re,
        rd_ready    => mm_rd_ready,
        data        => mm_data,
        initialize  => mm_initialize,
        dump        => '0'
      );

state_selection : process( clk, we1, we2, re1, re2, ch2_processing )
begin
    if rising_edge(clk) then
        if ch1_processing = '0' and ch2_processing = '0' then
            if re1 = '1' then
                state <= R1;
            elsif we1 = '1' then
                state <= W1;
            elsif re2 = '1' then
                state <= R2;
            elsif we2 = '1' then
                state <= W2;
            else
                state <= NO;
            end if ;
        end if ;

    --    if state = NO then -- init or no states selected
        --        if re1 = '1' then
        --            state <= R1;
        --            if re2 = '1'  then
        --                next_state <= R2;
        --            elsif we2 = '1' then
        --                next_state <= W2;
        --            end if ;
        --        elsif we1 = '1' then
        --            state <= W1;
        --            if re2 = '1'  then
        --                next_state <= R2;
        --            elsif we2 = '1' then
        --                next_state <= W2;
        --            end if ;
        --        elsif re2 = '1' then
        --            state <= R2;
        --        elsif we2 = '1' then
        --            state <= W2;
        --        end if ;

        --    -- finished with task
        --    elsif ch1_processing = '0' and (state = R1 or state = W1) then -- current state finished channel 1
        --        state <= next_state;
        --        next_state <= NO;

        --    elsif ch2_processing = '0' and (state = R2 or state = W2) then
        --        state <= next_state;
        --        next_state <= NO;

        --    -- busy with task, but next state empty
        --    elsif next_state = NO then 
        --        if ch1_processing = '1' and (state = R1 or state = W1) then -- current state finished channel 1
        --            if re2 = '1' then
        --                state <= R2;
        --            elsif we2 = '1' then
        --                state <= W2;
        --            end if ;

        --        elsif ch2_processing = '1' and (state = R2 or state = W2) then
        --            if re1 = '1' then
        --                state <= R1;
        --            elsif we1 = '1' then
        --                state <= W1;
        --            end if ;
        --        end if ;
        --    end if ;
    end if ;
end process ; -- state_selection

--busy_signal : process( state, next_state  )
    --begin
    --    if state = R1 or state = W1 then
    --        busy1 <= '1';
    --        if next_state = R2 or next_state = W2 then
    --            busy2 <= '1';
    --        else
    --            busy2 <= '0';
    --        end if ;
    --    elsif state = R2 or state = W2 then
    --        busy2 <= '1';
    --        if next_state = R1 or next_state = W1 then
    --            busy1 <= '1';
    --        else
    --            busy1 <= '0';
    --        end if ;
    --    else
    --        --busy1 <= '0';
    --        --busy2 <= '0';
    --    end if ;
    --end process ; -- busy_signal

set_mem_ports : process( clk, state )
begin
    --if rising_edge(clk) then
        if clk = '1' then
            if state = W1 then
                if we1 = '1' then
                    mm_address <= addr1;
                    mm_re <= '0';
                    mm_we <= we1 and not mm_wr_done;
                    mm_data <= data1;
                    if mm_wr_done = '0' and we1 = '1'then
                        ch1_processing <= '1';
                    else
                        ch1_processing <= '0';
                    end if ;
                    ch2_processing <= '0';
                end if ;

            elsif state = R1 then
                if re1 = '1' then
                    mm_address <= addr1;
                    mm_re <= re1;
                    mm_we <= '0';
                    mm_data <= (others => 'Z');
                    data1 <= mm_data;
                    if mm_rd_ready = '0' then
                        ch1_processing <= '1';
                    else
                        ch1_processing <= '0';
                    end if ;
                    ch2_processing <= '0';
                end if ;
                

            elsif state = R2 then
                if re2 = '1' then
                    mm_address <= addr2;
                    mm_re <= re2;
                    mm_we <= '0';
                    mm_data <= (others => 'Z');
                    data2 <= mm_data;
                    if mm_rd_ready = '0' and re2 = '1' then
                        ch2_processing <= '1';
                    else
                        ch2_processing <= '0';
                    end if ;
                    ch1_processing <= '0';
                end if ;

            elsif state = W2 then
                if we2 = '1' then
                    mm_address <= addr2;
                    mm_re <= '0';
                    mm_we <= we2 and not mm_wr_done;
                    mm_data <= data2;
                    if mm_wr_done = '0' and we2 = '1' then
                        ch2_processing <= '1';
                    else
                        ch2_processing <= '0';
                    end if ;
                    ch1_processing <= '0';
                end if ;
            end if ;             
        end if ;
    --end if ;
end process ; -- set_mem_ports


monitor_ch1 : process( ch1_processing, re1, we1 )
begin
    if falling_edge(ch1_processing) then
        ch1_done <= '1';
    elsif falling_edge(re1) or falling_edge(we1) then
        ch1_done <= '0';
    end if ;
end process ; -- monitor_ch1

monitor_ch2 : process( ch2_processing, re2, we2 )
begin
    if falling_edge(ch2_processing) then
        ch2_done <= '1';
    elsif falling_edge(re2) or falling_edge(we2) then
        ch2_done <= '0';
    end if ;
end process ; -- monitor_ch2

-- process blocks drive the chX_done signal
busy1 <= (re1 or we1) and not ch1_done;
busy2 <= (re2 or we2) and not ch2_done;

end behavioral;

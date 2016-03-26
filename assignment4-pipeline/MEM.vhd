library IEEE;
use IEEE.std_logic_1164.all;

entity MEM is
  port(
  n_reset : in std_logic;
  clk   : in  std_logic;
  data_in : in  std_logic_vector (31 downto 0); --  Connects with RDD of EX
  add_in : in std_logic_vector(4 downto 0); --  Connects with RDAO of EX
  mem_access_read : in std_logic; -- Connects with MAO of EX
  mem_access_write : in std_logic;  -- Connects with RAO of EX
  register_access_in : in std_logic; -- Connects with register access of EX stage, gets passed through to reg_access_out

  register_access_out : out std_logic; -- Connects with register access in of WB stage
  data_out : out std_logic_vector(31 downto 0); -- Output of read data
  );
end MEM;

architecture behavior of MEM is

  data_memory : ENTITY work.Main_Memory
  GENERIC MAP (
      Num_Bytes_in_Word   => NUM_BYTES_IN_WORD,
      Num_Bits_in_Byte    => NUM_BITS_IN_BYTE,
      Read_Delay          => 0,
      Write_Delay         => 0
  )
  PORT MAP (
      clk         => clk,
      address     => dm_address,
      Word_Byte   => '1',
      we          => dm_we,
      wr_done     => dm_wr_done,
      re          => dm_re,
      rd_ready    => dm_rd_ready,
      data        => dm_data,
      initialize  => dm_initialize,
      dump        => '0'
  );


  TYPE state_type IS (idle, m_read, m_write);
  SIGNAL state   : state_type := idle;

  mem_cycle : process( clk )
  begin
      register_access_out <= register_access_in;  --Pass through reg access signal
      if rising_edge(clk) then
          if mem_access_read = '1' then
              dm_address <= add_in;
              dm_re <= '1'
          elsif mem_access_write = '1'
          end if ;
          ---------
          CASE state IS
            WHEN idle=>
              dm_initialize <= '0';
              IF mem_access_read = '1' AND mem_access_write='0' THEN
                dm_re <= '1';
                dm_we <= '0';
                dm_address <= add_in;
                data_in<= (others =>'Z');
                state <= m_read;
              ELSIF mem_access_write = '1' AND mem_access_read='0' THEN
                dm_we <= '1';
                dm_re <= '0';
                dm_address <= add_in;
                state <= mem_write;
              ELSE
                dm_re <= '0';
                dm_we <= '0';
                state <= idle;
              END IF;
          WHEN m_read=>
            IF dm_rd_ready = '1' THEN
              data_out <= dm_data; --Probably wrong here
              dm_re <= '0';
              state <= idle;
            ELSE
              state <= m_read;
            END IF;
          WHEN m_write=>
            IF dm_wr_done = '1' THEN
              state <= idle;
            ELSE
              dm_data <= data_in;
              state <= m_write;
            END IF;
        end case;
      end if ;
  end process ; -- mem_cycle
  end behavior;

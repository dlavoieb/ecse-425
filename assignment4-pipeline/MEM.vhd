library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
use work.memory_arbiter_lib.all;

entity MEM is
  port(
  -clk   : in  std_logic;  -- Clock signal
  -n_reset : in std_logic; -- Active low reset signal
  -data_in : in std_logic_vector (31 downto 0); --  Connects with ex_mem_data_out
  -address_in : in std_logic_vector(31 downto 0); --  Connects with ex_ALU_result_out - Truncated down to 5 lower bits
  -mem_access_write : in std_logic;  -- Connects with ex_storeen_out
  -byte : in std_logic; -- when '1' you are interacting with the memory in word otherwise in byte
  -register_access_in : in std_logic; -- Connects with ex_reg_en_out
  -register_access_add_in : in std_logic_vector(reg_adrsize-1 downto 0); -- Connects with ex_dest_regadd_out (passthrough)

  register_access_out : out std_logic; -- Connects with register access in of WB stage (passthrough)
  register_access_add_out : out std_logic_vector(reg_adrsize-1 downto 0); -- ex_dest_regadd_out (passthrough)
  data_out : out std_logic_vector(31 downto 0) :=(others =>'Z')
  );
end entity;

-- REGISTERS PORTS :
-- clk : in std_logic;
-- n_rst : in std_logic; -- Active low reset signal
-- write_enable : in std_logic;  -- Write control signal
-- write_in : in std_logic_vector(31 downto 0);  -- Input data port
-- write_adr: in std_logic_vector(reg_adrsize-1 downto 0);-- address write
-- port1_adr : in std_logic_vector(reg_adrsize-1 downto 0); -- Port 1 read address
-- port2_adr : in std_logic_vector(reg_adrsize-1 downto 0); -- Port 2 read address
-- port1_out : out std_logic_vector(31 downto 0);  -- Read port 1
-- port2_out : out std_logic_vector(31 downto 0)  -- Read port 2
--
-- EX OUTPUTS :
-- signal ex_ALU_result_out:std_logic_vector (31 downto 0); -
-- signal ex_dest_regadd_out:std_logic_vector (reg_adrsize-1 downto 0);
-- signal ex_loaden_out: std_logic; -
-- signal ex_storeen_out:std_logic; -
-- signal ex_reg_en_out:std_logic;
-- signal ex_mem_data_out:std_logic_vector (31 downto 0); -

architecture behavior of MEM is

begin
  data_memory : ENTITY work.Data_Memory
  PORT MAP (
      clk => clk,
      n_rst => n_reset, -- Active low reset signal
      write_enable => mem_access_write,  -- Write control signal
      write_in  => data_in, -- Input data port
      write_adr => address_in(reg_adrsize*4-1 downto 0),-- address write
      port_adr  => address_in(reg_adrsize*4-1 downto 0), -- Port 1 read address :=(others =>'Z')
      byte => byte,
      port_out  => data_out  -- Read port 1
  );

  process(clk, n_reset)
  begin
    register_access_out <= register_access_in;  --Pass through reg access signal
    register_access_add_out <= register_access_add_in;
  end process ; -- mem_cycle
  end behavior;

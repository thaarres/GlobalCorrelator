-- null_algo
--
-- Do-nothing top level algo for testing
--
-- Dave Newbold, July 2013

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.emp_data_types.all;

use work.pf_data_types.all;
use work.pf_constants.all;

use work.emp_device_decl.all;

library Link;

entity PF_top is
	port(
		clk: in std_logic; -- ipbus signals
		d: in ldata(4 * N_REGION - 1 downto 0); -- data in
		q: out ldata(4 * N_REGION - 1 downto 0) -- data out
	);
end PF_top;

architecture rtl of PF_top is

  signal links_synced : ldata(4 * N_REGION - 1 downto 0);
  constant N_FRAMES_USED : natural := 1;
  signal start_pf : std_logic := '0';
  signal rst_pf : std_logic := '1';
  signal d_pf : pf_data(N_PF_IP_CORE_IN_CHANS - 1 downto 0);
  signal d_pf0 : pf_data(N_PF_IP_CORE_IN_CHANS - 1 downto 0);
  signal d_pf1 : pf_data(N_PF_IP_CORE_IN_CHANS - 1 downto 0);
  signal q_pf : pf_data(N_PF_IP_CORE_OUT_CHANS - 1 downto 0);
  type valid_array is array (natural range <>) of std_logic_vector(N_PF_IP_CORE_IN_CHANS - 1 downto 0);
  signal valid_pipe : valid_array(0 to PF_ALGO_LATENCY-1) := (others => (others => '0'));
  signal clk_p : std_logic := '0';

  -- Debug
  signal debug_q : Link.ArrayTypes.Vector(4 * N_REGION - 1 downto 0) := Link.ArrayTypes.NullVector(4 * N_REGION);

begin

   clk_p <= clk;

   link_sync : entity work.PatternFileLinkSync
   generic map(
    realLinkMin => 41,
    realLinkMax => 41,
    bufferLinkMin => 0,
    bufferLinkMax => 35
   )
   port map(
    clk => clk_p,
    linksIn => d,
    linksOut => links_synced
   );

    tie_unused :
    for i in 0 to 4 * N_REGION -1 generate
    begin
        tie_unused_only: if i > 35 and i /= 41 generate
            links_synced(i) <= lword_null;
        end generate;
    end generate;
   
    start_pipe_valid :
    for i in 0 to N_PF_IP_CORE_IN_CHANS - 1 generate
    begin
        valid_pipe(0)(i) <= links_synced(i).valid;
    end generate;

    pipe_valid :
    process(clk)
    begin
        if rising_edge(clk) then
            valid_pipe(1 to PF_ALGO_LATENCY - 1) <= valid_pipe(0 to PF_ALGO_LATENCY - 2);
        end if;
    end process;

    process(clk)
    begin
    if rising_edge(clk) then
        if valid_pipe(0)(0) = '1' and rst_pf = '1' then
            rst_pf <= '0';
        else
            rst_pf <= rst_pf;
        end if;
    end if;
    end process;
    -- Drive the IP core valid from the data valid
    start_pf <= valid_pipe(2)(0);

    ldata_to_pfdata :
    for i in 0 to N_PF_IP_CORE_IN_CHANS - 1 generate
    begin
        used:
        if i < 36 or i = 41 generate
            d_pf(i) <= links_synced(i).data;
        end generate used;
        unused:
        if i > 35 and i /= 41 generate
            d_pf(i) <= (others => '0');
        end generate unused;
    end generate;

    pipe_d:
    process(clk)
    begin
        if rising_edge(clk) then
            d_pf0 <= d_pf;
            d_pf1 <= d_pf0;
        end if;
    end process;

    pf_algo : entity work.pf_ip_wrapper
      PORT MAP (
        clk    => clk_p,
        rst    => rst_pf,
        start  => start_pf,
        input  => d_pf1,
        done   => open,
        idle   => open,
        ready  => open,
        output => q_pf
      );


    pfdata_to_ldata :
    for i in 0 to N_PF_IP_CORE_OUT_CHANS - 1 generate
    begin
        used:
        if i < 36 or i = 41 generate
            q(i).data <= q_pf(i);
            q(i).strobe <= '1';
            q(i).valid <= valid_pipe(PF_ALGO_LATENCY - 1)(i);
            q(i).start <= '0';
            debug_q(i) <= Link.DataType.from_lword(q(i));
        end generate;
        unused:
        if i >= 36 and i /= 41 generate
            q(i) <= lword_null;
            debug_q(i) <= Link.DataType.cNull;
        end generate;
    end generate;

    -- tie the unused links
    q(4 * N_REGION -1 downto N_PF_IP_CORE_OUT_CHANS) <= (others => lword_null);

    DebugInstance : entity Link.Debug
    generic map("LinksOut")
    port map(clk, debug_q);

end rtl;

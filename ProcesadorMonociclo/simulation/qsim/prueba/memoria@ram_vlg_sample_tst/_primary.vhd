library verilog;
use verilog.vl_types.all;
entity memoriaRam_vlg_sample_tst is
    port(
        Address         : in     vl_logic_vector(3 downto 0);
        clock           : in     vl_logic;
        Data_in         : in     vl_logic_vector(31 downto 0);
        Wr              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memoriaRam_vlg_sample_tst;

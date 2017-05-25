library verilog;
use verilog.vl_types.all;
entity programCounter_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        pSource         : in     vl_logic_vector(30 downto 0);
        sampler_tx      : out    vl_logic
    );
end programCounter_vlg_sample_tst;

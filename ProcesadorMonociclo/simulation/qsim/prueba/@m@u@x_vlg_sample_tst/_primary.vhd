library verilog;
use verilog.vl_types.all;
entity MUX_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        T               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end MUX_vlg_sample_tst;
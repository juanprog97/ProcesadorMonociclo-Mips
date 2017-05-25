library verilog;
use verilog.vl_types.all;
entity controlAllu_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        func            : in     vl_logic_vector(5 downto 0);
        op              : in     vl_logic_vector(1 downto 0);
        sampler_tx      : out    vl_logic
    );
end controlAllu_vlg_sample_tst;

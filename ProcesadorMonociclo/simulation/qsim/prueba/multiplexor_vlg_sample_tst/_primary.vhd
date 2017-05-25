library verilog;
use verilog.vl_types.all;
entity multiplexor_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        dato0           : in     vl_logic_vector(31 downto 0);
        dato1           : in     vl_logic_vector(31 downto 0);
        Senal           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end multiplexor_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity unidadControl_vlg_sample_tst is
    port(
        instruccion     : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end unidadControl_vlg_sample_tst;

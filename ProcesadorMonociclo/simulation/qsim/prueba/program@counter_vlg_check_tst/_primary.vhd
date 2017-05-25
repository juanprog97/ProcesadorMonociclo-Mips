library verilog;
use verilog.vl_types.all;
entity programCounter_vlg_check_tst is
    port(
        instruccion     : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end programCounter_vlg_check_tst;

library verilog;
use verilog.vl_types.all;
entity controlAllu_vlg_check_tst is
    port(
        operacion       : in     vl_logic_vector(1 downto 0);
        sampler_rx      : in     vl_logic
    );
end controlAllu_vlg_check_tst;

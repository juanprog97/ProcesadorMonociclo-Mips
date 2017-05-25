library verilog;
use verilog.vl_types.all;
entity allu_vlg_check_tst is
    port(
        Resultado       : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end allu_vlg_check_tst;

library verilog;
use verilog.vl_types.all;
entity programCounter_vlg_check_tst is
    port(
        Pc              : in     vl_logic_vector(30 downto 0);
        sampler_rx      : in     vl_logic
    );
end programCounter_vlg_check_tst;

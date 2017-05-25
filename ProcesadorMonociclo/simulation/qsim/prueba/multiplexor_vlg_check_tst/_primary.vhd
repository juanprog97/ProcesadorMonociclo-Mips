library verilog;
use verilog.vl_types.all;
entity multiplexor_vlg_check_tst is
    port(
        datoSalida      : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end multiplexor_vlg_check_tst;

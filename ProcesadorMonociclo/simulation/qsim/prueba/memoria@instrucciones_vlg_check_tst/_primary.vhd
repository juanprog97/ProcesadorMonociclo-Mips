library verilog;
use verilog.vl_types.all;
entity memoriaInstrucciones_vlg_check_tst is
    port(
        instruccion_out : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end memoriaInstrucciones_vlg_check_tst;

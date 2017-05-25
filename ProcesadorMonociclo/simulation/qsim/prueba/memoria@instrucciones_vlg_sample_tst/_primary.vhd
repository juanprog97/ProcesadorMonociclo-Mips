library verilog;
use verilog.vl_types.all;
entity memoriaInstrucciones_vlg_sample_tst is
    port(
        Address         : in     vl_logic_vector(4 downto 0);
        clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memoriaInstrucciones_vlg_sample_tst;

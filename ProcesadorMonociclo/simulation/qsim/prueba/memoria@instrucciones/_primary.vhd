library verilog;
use verilog.vl_types.all;
entity memoriaInstrucciones is
    port(
        clock           : in     vl_logic;
        Address         : in     vl_logic_vector(4 downto 0);
        instruccion_out : out    vl_logic_vector(31 downto 0)
    );
end memoriaInstrucciones;

library verilog;
use verilog.vl_types.all;
entity multiplexor is
    port(
        clock           : in     vl_logic;
        dato0           : in     vl_logic_vector(31 downto 0);
        dato1           : in     vl_logic_vector(31 downto 0);
        Senal           : in     vl_logic;
        datoSalida      : out    vl_logic_vector(31 downto 0)
    );
end multiplexor;

library verilog;
use verilog.vl_types.all;
entity programCounter is
    port(
        clock           : in     vl_logic;
        instruccion     : out    vl_logic_vector(31 downto 0)
    );
end programCounter;

library verilog;
use verilog.vl_types.all;
entity MUX is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        T               : in     vl_logic;
        Y               : out    vl_logic
    );
end MUX;

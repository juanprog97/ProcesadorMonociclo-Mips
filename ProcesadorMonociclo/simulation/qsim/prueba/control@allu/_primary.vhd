library verilog;
use verilog.vl_types.all;
entity controlAllu is
    port(
        clock           : in     vl_logic;
        op              : in     vl_logic_vector(1 downto 0);
        func            : in     vl_logic_vector(5 downto 0);
        operacion       : out    vl_logic_vector(1 downto 0)
    );
end controlAllu;

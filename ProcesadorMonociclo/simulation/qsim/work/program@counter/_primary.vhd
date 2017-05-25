library verilog;
use verilog.vl_types.all;
entity programCounter is
    port(
        clock           : in     vl_logic;
        Pc              : out    vl_logic_vector(30 downto 0);
        pSource         : in     vl_logic_vector(30 downto 0)
    );
end programCounter;

library verilog;
use verilog.vl_types.all;
entity memoriaRam is
    port(
        clock           : in     vl_logic;
        Address         : in     vl_logic_vector(3 downto 0);
        Data_in         : in     vl_logic_vector(31 downto 0);
        Wr              : in     vl_logic;
        Data_out        : out    vl_logic_vector(31 downto 0)
    );
end memoriaRam;

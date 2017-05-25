library verilog;
use verilog.vl_types.all;
entity allu is
    port(
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        operacion       : in     vl_logic_vector(1 downto 0);
        Resultado       : out    vl_logic_vector(7 downto 0)
    );
end allu;

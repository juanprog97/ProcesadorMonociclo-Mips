library verilog;
use verilog.vl_types.all;
entity unidadControl is
    port(
        clock           : in     vl_logic;
        instruccion     : in     vl_logic_vector(5 downto 0);
        RegDst          : out    vl_logic;
        branch          : out    vl_logic;
        memRead         : out    vl_logic;
        mentoReg        : out    vl_logic;
        memWrite        : out    vl_logic;
        AluSrc          : out    vl_logic;
        RegWrite        : out    vl_logic;
        jump            : out    vl_logic
    );
end unidadControl;

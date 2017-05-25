library verilog;
use verilog.vl_types.all;
entity unidadControl_vlg_check_tst is
    port(
        AluOP           : in     vl_logic_vector(1 downto 0);
        AluSrc          : in     vl_logic;
        branch          : in     vl_logic;
        jump            : in     vl_logic;
        memRead         : in     vl_logic;
        memWrite        : in     vl_logic;
        mentoReg        : in     vl_logic;
        RegDst          : in     vl_logic;
        RegWrite        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end unidadControl_vlg_check_tst;

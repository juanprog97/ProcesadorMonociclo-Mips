library verilog;
use verilog.vl_types.all;
entity registrosFicheros is
    port(
        RegA            : in     vl_logic_vector(3 downto 0);
        RegB            : in     vl_logic_vector(3 downto 0);
        WriteReg        : in     vl_logic_vector(3 downto 0);
        DataIn          : in     vl_logic_vector(31 downto 0);
        EW              : in     vl_logic;
        clock           : in     vl_logic;
        DataOutA        : out    vl_logic_vector(31 downto 0);
        DataOutB        : out    vl_logic_vector(31 downto 0)
    );
end registrosFicheros;

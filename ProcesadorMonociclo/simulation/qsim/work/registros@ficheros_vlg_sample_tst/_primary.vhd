library verilog;
use verilog.vl_types.all;
entity registrosFicheros_vlg_sample_tst is
    port(
        clock           : in     vl_logic;
        DataIn          : in     vl_logic_vector(31 downto 0);
        EW              : in     vl_logic;
        RegA            : in     vl_logic_vector(3 downto 0);
        RegB            : in     vl_logic_vector(3 downto 0);
        WriteReg        : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end registrosFicheros_vlg_sample_tst;

library verilog;
use verilog.vl_types.all;
entity registrosFicheros_vlg_check_tst is
    port(
        DataOutA        : in     vl_logic_vector(31 downto 0);
        DataOutB        : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end registrosFicheros_vlg_check_tst;

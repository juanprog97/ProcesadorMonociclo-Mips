library verilog;
use verilog.vl_types.all;
entity memoriaRam_vlg_check_tst is
    port(
        Data_out        : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end memoriaRam_vlg_check_tst;

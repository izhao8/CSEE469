library verilog;
use verilog.vl_types.all;
entity mux2to1 is
    port(
        \in\            : in     vl_logic;
        old             : in     vl_logic;
        \out\           : out    vl_logic;
        en              : in     vl_logic
    );
end mux2to1;

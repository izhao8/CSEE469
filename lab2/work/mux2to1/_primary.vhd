library verilog;
use verilog.vl_types.all;
entity mux2to1 is
    port(
        i1              : in     vl_logic;
        i0              : in     vl_logic;
        \out\           : out    vl_logic;
        en              : in     vl_logic
    );
end mux2to1;

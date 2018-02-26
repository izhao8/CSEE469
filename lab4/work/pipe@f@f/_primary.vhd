library verilog;
use verilog.vl_types.all;
entity pipeFF is
    generic(
        length          : integer := 64
    );
    port(
        q               : out    vl_logic_vector;
        d               : in     vl_logic_vector;
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of length : constant is 1;
end pipeFF;

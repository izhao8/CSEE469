library verilog;
use verilog.vl_types.all;
entity CPU_testbench is
    generic(
        clocks          : integer := 1200;
        ClockDelay      : integer := 50000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of clocks : constant is 1;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end CPU_testbench;

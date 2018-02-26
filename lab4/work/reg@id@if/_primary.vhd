library verilog;
use verilog.vl_types.all;
entity regIdIf is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        flush           : in     vl_logic;
        write           : in     vl_logic;
        \PC\            : in     vl_logic_vector(63 downto 0);
        instruct        : out    vl_logic_vector(31 downto 0);
        pc              : out    vl_logic_vector(63 downto 0);
        clk             : in     vl_logic
    );
end regIdIf;

library verilog;
use verilog.vl_types.all;
entity programCounter is
    port(
        \in\            : in     vl_logic_vector(63 downto 0);
        PCsrc           : in     vl_logic;
        \out\           : out    vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end programCounter;

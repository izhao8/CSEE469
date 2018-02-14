library verilog;
use verilog.vl_types.all;
entity arithmetic is
    port(
        A               : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0);
        \of\            : out    vl_logic;
        C               : out    vl_logic;
        sub             : in     vl_logic
    );
end arithmetic;

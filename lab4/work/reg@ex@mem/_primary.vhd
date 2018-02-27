library verilog;
use verilog.vl_types.all;
entity regExMem is
    port(
        \WB\            : in     vl_logic_vector(1 downto 0);
        M               : in     vl_logic_vector(3 downto 0);
        zero            : in     vl_logic;
        result          : in     vl_logic_vector(63 downto 0);
        \B\             : in     vl_logic_vector(63 downto 0);
        resultOut       : out    vl_logic_vector(63 downto 0);
        Bo              : out    vl_logic_vector(63 downto 0);
        zout            : out    vl_logic;
        Rd              : in     vl_logic_vector(4 downto 0);
        Rdout           : out    vl_logic_vector(4 downto 0);
        wb              : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        MemRead         : out    vl_logic;
        branch          : out    vl_logic;
        clk             : in     vl_logic;
        b               : out    vl_logic
    );
end regExMem;

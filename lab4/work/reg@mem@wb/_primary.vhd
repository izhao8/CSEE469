library verilog;
use verilog.vl_types.all;
entity regMemWb is
    port(
        WB              : in     vl_logic_vector(1 downto 0);
        data            : in     vl_logic_vector(63 downto 0);
        addr            : in     vl_logic_vector(63 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        Rdout           : out    vl_logic_vector(4 downto 0);
        RegWrite        : out    vl_logic;
        MemtoReg        : out    vl_logic;
        addrO           : out    vl_logic_vector(63 downto 0);
        dataO           : out    vl_logic_vector(63 downto 0);
        clk             : in     vl_logic
    );
end regMemWb;

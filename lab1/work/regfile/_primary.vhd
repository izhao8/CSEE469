library verilog;
use verilog.vl_types.all;
entity regfile is
    port(
        RA              : in     vl_logic_vector(4 downto 0);
        RB              : in     vl_logic_vector(4 downto 0);
        data            : in     vl_logic_vector(63 downto 0);
        DRA             : out    vl_logic_vector(63 downto 0);
        DRB             : out    vl_logic_vector(63 downto 0);
        RW              : in     vl_logic_vector(4 downto 0);
        en              : in     vl_logic;
        clk             : in     vl_logic
    );
end regfile;

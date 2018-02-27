library verilog;
use verilog.vl_types.all;
entity controlMUX is
    port(
        sel             : in     vl_logic;
        \WB\            : in     vl_logic_vector(1 downto 0);
        \M\             : in     vl_logic_vector(3 downto 0);
        \EX\            : in     vl_logic_vector(5 downto 0);
        wb              : out    vl_logic_vector(1 downto 0);
        m               : out    vl_logic_vector(3 downto 0);
        ex              : out    vl_logic_vector(5 downto 0)
    );
end controlMUX;

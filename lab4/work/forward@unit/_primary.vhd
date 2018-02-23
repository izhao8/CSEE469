library verilog;
use verilog.vl_types.all;
entity forwardUnit is
    port(
        forA            : out    vl_logic_vector(1 downto 0);
        forB            : out    vl_logic_vector(1 downto 0);
        Rn              : in     vl_logic_vector(4 downto 0);
        Rm              : in     vl_logic_vector(4 downto 0);
        EXmemrd         : in     vl_logic_vector(4 downto 0);
        MEMwbrd         : in     vl_logic_vector(4 downto 0);
        memWB           : in     vl_logic_vector(1 downto 0);
        exWB            : in     vl_logic_vector(1 downto 0)
    );
end forwardUnit;

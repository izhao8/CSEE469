library verilog;
use verilog.vl_types.all;
entity dataMUX is
    port(
        data            : in     vl_logic_vector(63 downto 0);
        result          : in     vl_logic_vector(63 downto 0);
        regData         : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0);
        sel             : in     vl_logic_vector(1 downto 0)
    );
end dataMUX;

library verilog;
use verilog.vl_types.all;
entity mux5to1 is
    port(
        ADD             : in     vl_logic_vector(63 downto 0);
        \AND\           : in     vl_logic_vector(63 downto 0);
        \XOR\           : in     vl_logic_vector(63 downto 0);
        \OR\            : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        \out\           : out    vl_logic_vector(63 downto 0);
        sel             : in     vl_logic_vector(2 downto 0)
    );
end mux5to1;

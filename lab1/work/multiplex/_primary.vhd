library verilog;
use verilog.vl_types.all;
entity multiplex is
    port(
        \in\            : in     vl_logic;
        \out\           : out    vl_logic_vector(63 downto 0);
        read            : in     vl_logic_vector(4 downto 0)
    );
end multiplex;

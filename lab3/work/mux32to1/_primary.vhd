library verilog;
use verilog.vl_types.all;
entity mux32to1 is
    port(
        \in\            : in     vl_logic_vector(31 downto 0);
        \out\           : out    vl_logic;
        sel             : in     vl_logic_vector(4 downto 0)
    );
end mux32to1;

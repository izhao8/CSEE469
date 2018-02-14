library verilog;
use verilog.vl_types.all;
entity mux2to1other is
    port(
        \in\            : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic;
        sel             : in     vl_logic
    );
end mux2to1other;

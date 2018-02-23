library verilog;
use verilog.vl_types.all;
entity ALUcontrol is
    port(
        instruct        : in     vl_logic_vector(10 downto 0);
        Op              : in     vl_logic_vector(1 downto 0);
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end ALUcontrol;

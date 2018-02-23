library verilog;
use verilog.vl_types.all;
entity hazard is
    port(
        PCwrite         : out    vl_logic;
        IfIdwrite       : out    vl_logic;
        csel            : out    vl_logic;
        Rn              : in     vl_logic_vector(4 downto 0);
        Rm              : in     vl_logic_vector(4 downto 0);
        IdExRn          : in     vl_logic_vector(4 downto 0);
        memRead         : in     vl_logic
    );
end hazard;

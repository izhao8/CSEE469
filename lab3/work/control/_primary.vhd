library verilog;
use verilog.vl_types.all;
entity control is
    port(
        instruct        : in     vl_logic_vector(10 downto 0);
        Reg2Loc         : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemtoReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic_vector(2 downto 0);
        RegWrite        : out    vl_logic;
        UncondB         : out    vl_logic;
        B               : out    vl_logic
    );
end control;

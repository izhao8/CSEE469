library verilog;
use verilog.vl_types.all;
entity regExId is
    port(
        \WB\            : in     vl_logic_vector(1 downto 0);
        \M\             : in     vl_logic_vector(3 downto 0);
        EX              : in     vl_logic_vector(5 downto 0);
        A               : in     vl_logic_vector(63 downto 0);
        B               : in     vl_logic_vector(63 downto 0);
        ADDI            : in     vl_logic_vector(63 downto 0);
        Rd              : in     vl_logic_vector(4 downto 0);
        Ao              : out    vl_logic_vector(63 downto 0);
        Bo              : out    vl_logic_vector(63 downto 0);
        Rdout           : out    vl_logic_vector(4 downto 0);
        addIO           : out    vl_logic_vector(63 downto 0);
        clk             : in     vl_logic;
        Rn              : in     vl_logic_vector(4 downto 0);
        Rm              : in     vl_logic_vector(4 downto 0);
        Rno             : out    vl_logic_vector(4 downto 0);
        Rmo             : out    vl_logic_vector(4 downto 0);
        wb              : out    vl_logic_vector(1 downto 0);
        m               : out    vl_logic_vector(3 downto 0);
        Reg2Loc         : out    vl_logic;
        ALUOp           : out    vl_logic_vector(1 downto 0);
        ALUSrc          : out    vl_logic_vector(2 downto 0);
        OP              : in     vl_logic_vector(10 downto 0);
        Opout           : out    vl_logic_vector(10 downto 0)
    );
end regExId;

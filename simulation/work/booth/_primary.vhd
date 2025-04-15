library verilog;
use verilog.vl_types.all;
entity booth is
    port(
        product         : out    vl_logic_vector(15 downto 0);
        busy            : out    vl_logic;
        m               : in     vl_logic_vector(7 downto 0);
        r               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        start           : in     vl_logic
    );
end booth;

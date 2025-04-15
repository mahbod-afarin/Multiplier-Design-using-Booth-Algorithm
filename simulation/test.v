module test();
  
  reg [7:0] m, r;
  wire [15:0] product;
  reg clk, start;
  wire busy;
  booth b(product, busy, m, r, clk, start);
  
  
  initial
  begin
    clk = 0;
    start = 0;
    r = 8'd4;
    m = 8'd3;
    #3
    start = 1;
    #4
    start = 0;
    #100;
    $stop;
  end
  always
    #5 clk = !clk;
endmodule

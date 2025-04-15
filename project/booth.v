module booth (
    output reg [15:0] product, // Final product
    output wire busy,          // High while multiplier is running
    input wire [7:0] m,        // Multiplicand
    input wire [7:0] r,        // Multiplier
    input wire clk,            // Clock
    input wire start           // Start signal
);

  reg [16:0] p;               // Partial product + extra bit
  reg [16:0] a, s;            // a = +m, s = -m (aligned)
  reg [3:0] counter = 0;      // 4-bit counter (up to 8 cycles)
  reg running = 0;            // Internal running flag

  assign busy = running;      // Output busy signal

  always @(posedge clk) begin
    if (start && !running) begin
      // Initialization
      a <= {m, 9'd0};              // left shift by 9 to align
      s <= {-m, 9'd0};             // negative m (2's comp), shifted
      p <= {8'd0, r, 1'b0};        // partial product: [A | Q | Q-1]
      counter <= 0;
      running <= 1;
    end else if (running && counter < 8) begin
      // Booth's operation
      case (p[1:0])
        2'b10: p <= p + s;
        2'b01: p <= p + a;
        default: ; // 00 or 11: no operation
      endcase

      // Arithmetic right shift
      p <= $signed(p) >>> 1;

      counter <= counter + 1;

      if (counter == 7) begin
        running <= 0;
        product <= p[16:1];  // Capture the final result
      end
    end
  end

endmodule
# Multiplier-Design-using-Booth-Algorithm

The goal of this experiment is to design a **multiplier unit** that uses the **Booth multiplication algorithm** for signed binary multiplication.

## Design Components

Your implementation should consist of two main parts:

1. **Data Path**
   - Performs the arithmetic operations (e.g., addition, subtraction, shifting).
   - Includes the registers, adder/subtractor, and shift unit.

2. **Control Unit**
   - Generates control signals to manage each step of the Booth multiplication process.
   - Handles sequencing and decision-making during the algorithm's execution.

After designing both modules independently, **connect them to form a complete multiplier unit**.

## Key Requirements

- When shifting the **Multiplier** to the right, your shift unit must support shifting **by more than one bit per clock cycle**.
- This enables performance improvements over the traditional **Add & Shift** method.
- Ensure the shift logic is optimized for speed and supports variable-length shifts as required by the Booth algorithm.

## Expected Outcome

- Correct implementation of Booth’s multiplication logic.
- Ability to handle signed binary inputs.
- Efficient shift logic to accelerate multiplication compared to basic methods.

## Tools

- Verilog / VHDL
- Simulation: ModelSim / Vivado
- FPGA Board (optional for hardware demonstration)

--

## Project Overview

In this project, we designed and implemented an **8-bit Booth Multiplier**. The multiplier takes two 8-bit signed inputs, `m` and `r`, and produces a **16-bit signed output** named `product`. Additionally, a `busy` signal indicates whether the multiplier is still processing or has completed the operation.

## System Design

- The multiplier includes:
  - **Three 17-bit registers**: `a`, `s`, and `p`
  - A **control counter**
  - A **start** signal to trigger the multiplication process

- Booth’s algorithm is implemented over **8 iterations**:
  - In each iteration, the **least significant two bits** of register `p` are examined.
  - Depending on their value:
    - Add `a` to `p`
    - Subtract using `s` and add to `p`
    - Or do nothing
  - Then, `p` is **arithmetic right shifted**.

- Final product is extracted from `p[16:1]`.

## Testbench Code

```verilog
module test();
  reg [7:0] m, r;
  wire [15:0] product;
  reg clk, start;
  wire busy;

  booth b(product, busy, m, r, clk, start);

  initial begin
    clk = 0;
    m = 8'd3;
    r = -8'd1;
    #3 start = 1;
    #4 start = 0;
    #100 $stop;
  end

  always #5 clk = !clk;
endmodule
```

## Simulation Results

### Inputs
- `m = -1`
- `r = 3`

### Timing
- After **4 clock cycles**, the `busy` signal becomes `0`, indicating the multiplication is complete.

### Output
- Final product: `-68` (which is the correct result for -1 × 68)

# Multiplier-Design-using-Booth-Algorithm

### Objective

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

---

## ⚙️ Key Requirements

- When shifting the **Multiplier** to the right, your shift unit must support shifting **by more than one bit per clock cycle**.
- This enables performance improvements over the traditional **Add & Shift** method.
- Ensure the shift logic is optimized for speed and supports variable-length shifts as required by the Booth algorithm.

---

## ✅ Expected Outcome

- Correct implementation of Booth’s multiplication logic.
- Ability to handle signed binary inputs.
- Efficient shift logic to accelerate multiplication compared to basic methods.

---

## 🛠 Tools

- Verilog / VHDL
- Simulation: ModelSim / Vivado
- FPGA Board (optional for hardware demonstration)

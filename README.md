# ECE128-Lab8-ROM-RAM

## Overview

This lab implements and verifies two basic memory modules in Verilog:
1. An 8×4 ROM with fixed contents implemented using a case statement.
2. An 8×8 RAM with synchronous read and write behavior.

Both designs were simulated in Vivado 2023.1 using behavioral testbenches to confirm correct functionality.
Synthesis, utilization reports, power analysis, and RTL schematics were also generated.

No FPGA board programming was performed in this lab.

## ROM (8×4) Description
The ROM stores eight constant 4-bit values. A 3-bit address selects which value is output.
The module is purely combinational.

### Ports
addr[2:0] – Address input
data[3:0] – Output word

### Behavior
The output changes immediately when addr changes.

## RAM (8×8) Description
The RAM stores eight 8-bit words. All behavior occurs on the rising edge of the clock.

### Ports
clk – Clock
en – Enable
we – Write enable
addr[2:0] – Memory address
din[7:0] – Data input
dout[7:0] – Registered data output

### Behavior
If en = 1 and we = 1, din is written to mem[addr].
If en = 1 and we = 0, dout updates to mem[addr] on the next clock rising edge.

## Simulation Summary
### ROM Simulation
- Address incremented from 0 to 7.
- Output values matched the case-defined data table.
- Waveform confirmed correct combinational behavior.

### RAM Simulation
- Data AA, 55, F0, and 0F were written to addresses 0–3.
- Same values were read back correctly with a one-cycle synchronous delay.
- Initial “xx” output before the first clock event was expected.

## Synthesis and Analysis
Vivado inferred distributed LUT memory for both ROM and RAM due to their small size.

### ROM Utilization
- Slice LUTs: 2
- Registers: 1
- LUT as Logic: 2

### RAM Utilization
- Slice LUTs: 9
- Registers: 8
- LUT as Memory: 8

### Power
- ROM total on-chip power: approximately 1.51 W
- RAM total on-chip power: approximately 0.073 W
Differences in dynamic power result from Vivado’s default switching assumptions for combinational vs. synchronous logic.

## How to Run in Vivado
1. Create a new RTL project in Vivado 2023.1.
2. Add rom8x4.v and ram8x8.v as Design Sources.
3. Add rom8x4_tb.v and ram8x8_tb.v as Simulation Sources.
4. Set the desired testbench as the simulation top.
5. Run Behavioral Simulation.
6. Add signals to the waveform viewer if necessary.

No constraints or FPGA programming are required.


### Author 
Name: Corina Saenz 
ECE 128 – FPGA Laboratory Fall 2025

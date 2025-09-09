Project Overview

This project implements and verifies a single-port synchronous SRAM (Static RAM) using Intel Quartus Prime Lite. The SRAM block was generated using the MegaWizard Plug-In Manager (altsyncram) and integrated into a top module (sram_top). A Verilog testbench (sram_tb.v) was developed to simulate basic memory operations such as write and read using ModelSim.
Current Flow (Working So Far)
Designed a top module (sram_top) that instantiates the altsyncram-based SRAM.
Implemented a testbench (sram_tb.v) that performs:
WRITE phase: Stores values A5 at address 5 and 3C at address 10.
READ phase: Reads the same addresses to confirm correct data retrieval.
Verified functional correctness by observing outputs in ModelSim (data_out matches expected values).


Description
The design demonstrates how a custom memory block can be integrated into a digital system using Quartus Prime Lite. The SRAM configuration chosen was:
Depth: 1024 words (10-bit address bus)
Width: 8-bit data bus
Mode: Single-port, synchronous read/write
Device Family: Cyclone II (for simulation)
The testbench provides a 100 MHz clock and systematically applies write and read sequences. During simulation, $display statements confirm that data written at addresses is correctly retrieved, ensuring the SRAM behaves as expected.

Challenges Faced
Understanding the altsyncram megafunction parameters (clock enables, read-during-write mode, etc.).
Initial difficulty in generating the simulation model (sram_1p.v) and ensuring compatibility with ModelSim.
Conceptual shift from generic Verilog RAM implementation to tool-generated IP block integration.

Tools Used
Quartus II targeting an Altera CycloneII FPGA (Megafunction Wizard, design entry)
ModelSim (functional verification)

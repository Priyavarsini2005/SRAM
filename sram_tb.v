`timescale 1ns/1ps

module sram_tb;

    reg clk;
    reg we;
    reg [9:0] addr;
    reg [7:0] data_in;
    wire [7:0] data_out;

    // Instantiate top module
    sram_top dut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation: 10ns period = 100MHz
    always #5 clk = ~clk;

    initial begin
        // Init
        clk = 0;
        we = 0;
        addr = 0;
        data_in = 0;

        // Wait for reset time
        #20;

        // WRITE phase
        we = 1;
        addr = 10'd5;
        data_in = 8'hA5;    // Write value A5 at address 5
        #10;

        addr = 10'd10;
        data_in = 8'h3C;    // Write value 3C at address 10
        #10;

        // READ phase
        we = 0;
        addr = 10'd5;       // Read back address 5
        #10;
        $display("Read from addr 5 = %h (expected A5)", data_out);

        addr = 10'd10;      // Read back address 10
        #10;
        $display("Read from addr 10 = %h (expected 3C)", data_out);

        // End simulation
        #20;
        $stop;
    end

endmodule

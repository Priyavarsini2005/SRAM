module sram_top (
    input clk,
    input we,
    input [9:0] addr,       // 1024-depth → 10-bit address
    input [7:0] data_in,    // 8-bit data
    output [7:0] data_out
);

    // Instantiate the SRAM
    sram_1p my_sram (
        .clock(clk),
        .wren(we),
        .address(addr),
        .data(data_in),
        .q(data_out)
    );

endmodule

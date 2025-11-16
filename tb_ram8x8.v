`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:39:00 PM
// Design Name: 
// Module Name: tb_ram8x8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_ram8x8;
    reg        clk;
    reg        en;
    reg        we;
    reg  [2:0] addr;
    reg  [7:0] din;
    wire [7:0] dout;

    ram8x8 uut (.clk(clk), .en(en), .we(we), .addr(addr), .din(din), .dout(dout));

    // clock 
    initial clk = 0;
    always #5 clk = ~clk; 

    initial begin
        en   = 0;
        we   = 0;
        addr = 3'b000;
        din  = 8'b00000000;

        // enable the RAM
        #10 en = 1;

        // write phase
        we = 1;
        addr = 3'b000; din = 8'hAA; #10;
        addr = 3'b001; din = 8'h55; #10;
        addr = 3'b010; din = 8'hF0; #10;
        addr = 3'b011; din = 8'h0F; #10;
        we = 0;

        // read phase
        addr = 3'b000; #10;
        addr = 3'b001; #10;
        addr = 3'b010; #10;
        addr = 3'b011; #10;

        #20 $finish;
    end
endmodule

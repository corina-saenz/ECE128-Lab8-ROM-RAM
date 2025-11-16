`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 02:39:46 PM
// Design Name: 
// Module Name: tb_rom8x4
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


module tb_rom8x4;
    reg  [2:0] addr;
    wire [3:0] data;

    rom8x4 uut (.addr(addr), .data(data));

    initial begin
        addr = 3'b000;
        #10 addr = 3'b001;
        #10 addr = 3'b010;
        #10 addr = 3'b011;
        #10 addr = 3'b100;
        #10 addr = 3'b101;
        #10 addr = 3'b110;
        #10 addr = 3'b111;
        #10 $finish;
    end
endmodule

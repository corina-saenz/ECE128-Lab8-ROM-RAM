`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:34:08 PM
// Design Name: 
// Module Name: ram8x8
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


module ram8x8 (
    input        clk,
    input        en,
    input        we,
    input      [2:0] addr,
    input      [7:0] din,
    output reg [7:0] dout
);
    reg [7:0] mem [0:7];

    always @(posedge clk) begin
        if (en) begin
            if (we)
                mem[addr] <= din;
            dout <= mem[addr];
        end
    end
endmodule

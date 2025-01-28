`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 01:01:04 PM
// Design Name: 
// Module Name: P6_R3
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


module P6_R3(
    input A,
    input B,
    input C,
    output X
    );

wire N1, N2, N3;

// AND gate with 5 ns delay
assign #5 N1 = A & B;
// NOT Gate w/ 5 ns delay
assign #5 N2 = ~B;
// AND Gate w/ 5 ns delay
assign #5 N3 = N2 & C;
// OR Gate w 5 ns delay
assign #5 X = N1 | N3;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 10:27:43 PM
// Design Name: 
// Module Name: P6_R2
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


module P6_R2(

    input A,
    input B,
    input C,
    output X
    );

wire N1, N2, N3;

// AND gate with 1ns delay
assign #1 N1 = A & B;
// NOT gate with 1ns delay
assign #1 N2 = ~B;
// AND gate with 1ns delay
assign #1 N3 = N2 & C;
// OR gate with 2ns delay (changed from 1ns to 2ns)
assign #2 X = N1 | N3;
    

endmodule

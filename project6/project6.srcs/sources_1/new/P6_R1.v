`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 10:01:46 PM
// Design Name: 
// Module Name: P6_R1
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

module CombCirc(
   input A,
   input B,
   input C,
   output X
   );

    // Circuit Description
    //assign X = ((A&B) + (~B&C));

    wire N1, N2, N3;

    // AND gate with 1ns delay
    assign #1 N1 = A & B;
    // NOT gate with 1ns delay
    assign #1 N2 = ~B;
    // AND gate with 1ns delay
    assign #1 N3 = N2 & C;
    // OR gate with 1ns delay
    assign #1 X = N1 | N3;
    
endmodule

module P6_R1(

    );
endmodule

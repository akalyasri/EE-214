`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2024 01:01:46 PM
// Design Name: 
// Module Name: P6_R3_tb
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


module P6_R3_tb;
    reg A, B, C;
    wire X;

    
    CombCirc uut (
        .A(A),
        .B(B),
        .C(C),
        .X(X)
    );

    integer k = 0;

    initial begin
        
        A = 0;
        B = 0;
        C = 0;

        // global reset to finish
        #100; 

        
        for(k = 0; k < 4; k = k + 1) begin
            {A, C} = k; // change A and C
            #5 B = 1;   // set B to 1
            #5 B = 0;   // set B to 0
            #5;         // wait
        end
    end
endmodule

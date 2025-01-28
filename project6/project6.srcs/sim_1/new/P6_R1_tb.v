`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/15/2024 10:06:14 PM
// Design Name: 
// Module Name: P6_R1_tb
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


module P6_R1_tb;
    
    // Inputs
    reg A;
    reg B;
    reg C;
    
    // Output
    wire X;
    
    // Instantiate the combinational circuit
    CombCirc uut (
        .A(A),
        .B(B),
        .C(C),
        .X(X)
    );
    
    // Variable for loop
    integer k;
    
    // Initialize and toggle inputs
    initial begin
        // Initialize inputs
        A = 0;
        B = 0;
        C = 0;
        
        // Wait for global reset
        #100;
        
        // Generate input sequence
        for (k = 0; k < 4; k = k + 1) begin
            {A, C} = k; // Change A and C
            #5 B = 1;   // Set B to 1
            #5 B = 0;   // Set B to 0
            #5;         // Wait for some time
        end
    end

endmodule

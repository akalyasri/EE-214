`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/30/2024 05:33:44 PM
// Design Name: 
// Module Name: P11_R1_tb
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


module P11_R1_tb;

// Inputs
reg A;
reg B;
reg clk;
reg rst;

// Outputs
wire F;
wire Cout;

// Instantiate the Unit Under Test (UUT)
P11_R1 uut (
    .A(A), 
    .B(B), 
    .clk(clk), 
    .rst(rst), 
    .F(F), 
    .Cout(Cout)
);

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10 ns clock period
end

// Test stimulus
initial begin
    // Initialize inputs
    rst = 1;
    A = 0;
    B = 0;

    // Wait for reset
    #10;
    rst = 0;

    // Apply all input combinations
    $display("Time\tA\tB\tF\tCout");
    $monitor("%0dns\t%b\t%b\t%b\t%b", $time, A, B, F, Cout);

    // Test all combinations of A and B
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    // Repeat with reset
    rst = 1; #10; rst = 0;
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    // Finish simulation
    $finish;
end

endmodule
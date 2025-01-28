`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/11/2024 09:46:15 AM
// Design Name: 
// Module Name: P12_C1_tb
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


module SwitchBounceMeasurer_tb;

    // Testbench signals
    reg clk;
    reg reset;
    reg switch_input;
    wire [31:0] bounce_time_ns;

    // Instantiate the SwitchBounceMeasurer module
    SwitchBounceMeasurer uut (
        .clk(clk),
        .reset(reset),
        .switch_input(switch_input),
        .bounce_time_ns(bounce_time_ns)
    );

    // Clock generation (100MHz -> 10ns period)
    always #5 clk = ~clk;

    // Stimulus generation
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        switch_input = 0;

        // Reset the system
        #20 reset = 0;

        // Simulate a clean 0-to-1 transition (no bounce)
        #50 switch_input = 1; 
        #50 switch_input = 0; 
        #50 switch_input = 1;

        // Wait and observe
        #100;

        // Simulate a bouncy 0-to-1 transition
        #50 switch_input = 1;
        #20 switch_input = 0;
        #30 switch_input = 1;
        #10 switch_input = 0;
        #40 switch_input = 1;

        // Wait and observe results
        #200;

        $stop; // End simulation
    end

endmodule


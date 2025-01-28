`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/13/2024 01:19:26 PM
// Design Name: 
// Module Name: P10_R1
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


/*module P10_R1(
    input [7:0] A, 
    input [7:0] B, 
    input [2:0] control, 
    input clock, 
    input load,
    output reg [7:0] result
    );
           
    always @ (posedge clock) begin
        if (load) begin
            result <= A;
        end else begin
            case (control)
                3'b000: result <= A + B;        // Addition
                3'b001: result <= A + 8'b1;     // Increment
                3'b010: result <= A - B;        // Subtract
                3'b011: result <= A ^ B;        // Bit-wise XOR
                3'b100: result <= A | B;        // Bit-wise OR
                3'b101: result <= A & B;        // Bit-wise AND
                default: result <= 8'b0;        // Default output
            endcase
        end
    end
endmodule
*/

module ALU (
    input [7:0] A, B,     // 8-bit inputs A and B
    input [2:0] OpCode,   // 3-bit opcode to select operation
    input Cin,             // Carry input
    output reg [7:0] F,    // 8-bit output
    output reg Cout        // Carry-out
);

always @(*) begin
    case (OpCode)
        3'b000: begin // Addition
            {Cout, F} = A + B + Cin;
        end
        3'b001: begin // Increment
            {Cout, F} = A + 1 + Cin;
        end
        3'b010: begin // Subtraction
            {Cout, F} = A - B - Cin;
        end
        3'b011: begin // No Operation
            F = 8'b00000000;
            Cout = 1'b0;
        end
        3'b100: begin // Bit-wise XOR
            F = A ^ B;
            Cout = 1'b0; // No carry out for XOR
        end
        3'b101: begin // Bit-wise Inversion
            F = ~A;
            Cout = 1'b0; // No carry out for inversion
        end
        3'b110: begin // Bit-wise OR
            F = A | B;
            Cout = 1'b0; // No carry out for OR
        end
        3'b111: begin // Bit-wise AND
            F = A & B;
            Cout = 1'b0; // No carry out for AND
        end
        default: begin
            F = 8'b00000000;
            Cout = 1'b0;
        end
    endcase
end

endmodule

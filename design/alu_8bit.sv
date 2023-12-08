`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.12.2023 01:44:24
// Design Name: 
// Module Name: alu_8bit
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

`include "../testbench/defines.sv"
module alu_8bit(
   output reg [`DATA_WIDTH : 0]    result_out,
   input  [`DATA_WIDTH -1:0]   a_in, b_in,
   input  [`OPCODE_WIDTH -1:0] opcode_in
);

always_comb
begin: arithmetic_operation
   case(opcode_in)
    	TFRA :	result_out = a_in;
        ADD  :	result_out = a_in + b_in;
        SUB  :	result_out = a_in - b_in; 
        INCRA:	result_out = a_in + 1'b1;
        DECRA:	result_out = a_in - 1'b1;
        INCRB:	result_out = b_in + 1'b1;
        DECRB:	result_out = b_in - 1'b1;
        TFRB :	result_out = a_in;
	default: result_out = a_in;
   endcase
end: arithmetic_operation

always_comb
begin: logical_operation
	case(opcode_in)	
        OR_G :	result_out = a_in | b_in;
        XOR_G:	result_out = a_in ^ b_in;
        AND_G:	result_out = a_in & b_in;
        NOT_G:	result_out = ~a_in;
	default: result_out = ~a_in;
endcase

end: logical_operation

endmodule

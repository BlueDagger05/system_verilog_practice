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

`include "../testbench/interface.sv"
//`include "../defines/defines.sv"
module alu_8bit(alu_ifc ifc);

always_comb
begin: arithmetic_operation
   case({!ifc.opcode_in[`OPCODE_WIDTH-1], ifc.opcode_in[`OPCODE_WIDTH-2:0]})
    	  TFRA :	ifc.result_out = ifc.a_in;
        ADD  :	ifc.result_out = ifc.a_in + ifc.b_in;
        SUB  :	ifc.result_out = ifc.a_in - ifc.b_in; 
        INCRA:	ifc.result_out = ifc.a_in + 1'b1;
        DECRA:	ifc.result_out = ifc.a_in - 1'b1;
        INCRB:	ifc.result_out = ifc.b_in + 1'b1;
        DECRB:	ifc.result_out = ifc.b_in - 1'b1;
        TFRB :	ifc.result_out = ifc.a_in;
	default: ifc.result_out = ifc.a_in;
   endcase
end: arithmetic_operation

always_comb
begin: logical_operation
	case({ifc.opcode_in[`OPCODE_WIDTH-1], ifc.opcode_in[`OPCODE_WIDTH-2:0]})	
        OR_G :	ifc.result_out = ifc.a_in | ifc.b_in;
        XOR_G:	ifc.result_out = ifc.a_in ^ ifc.b_in;
        AND_G:	ifc.result_out = ifc.a_in & ifc.b_in;
        NOT_G:	ifc.result_out = ~ifc.a_in;
	     default: ifc.result_out = ~ifc.a_in;
endcase

end: logical_operation

endmodule

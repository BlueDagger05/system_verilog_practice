`include "../defines/defines.sv"
// DONOT include defines.sv

interface alu_ifc();
	logic [`DATA_WIDTH -1:0] 	   a_in;
	logic [`DATA_WIDTH -1:0] 	   b_in;
	logic [`OPCODE_WIDTH -1:0] 	opcode_in;
	logic [`DATA_WIDTH : 0] 	   result_out;

	modport DUT (input a_in, b_in, opcode_in, output result_out);
endinterface: alu_ifc

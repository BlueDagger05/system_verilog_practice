`define DATA_WIDTH 8
`define OPCODE_WIDTH 4

parameter TFRA    = 4'b0000;
parameter ADD     = 4'b0001;
parameter SUB  	= 4'b0010;
parameter INCRA   = 4'b0011;
parameter DECRA   = 4'b0100;
parameter INCRB   = 4'b0101;
parameter DECRB	= 4'b0110;
parameter TFRB 	= 4'b0111;

parameter OR_G	   = 4'b1000;
parameter XOR_G	= 4'b1001;
parameter AND_G	= 4'b1010;
parameter NOT_G	= 4'b1011;

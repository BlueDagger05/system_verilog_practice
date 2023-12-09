//`include "../defines/defines.sv"
class Transaction;

	// fields having random values
	rand bit [`DATA_WIDTH -1:0] 	a_in;
	rand bit [`DATA_WIDTH -1:0] 	b_in;
	rand bit [`OPCODE_WIDTH -1:0] 	opcode_in;
	
	// trxnDisplay function to display start of trxn
	function void trxnDisplay();
		$display("Start of transaction.....");
	endfunction: trxnDisplay

	function void displayData(int packetCount);
		$display("TRXN[%0d] :: a_in = 0x%0h, b_in = 0x%0h, opcode_in = 0x%0h", packetCount, a_in, b_in, opcode_in);
	endfunction: displayData
	
	// random constraints
	constraint a_in_C   {a_in 	inside {[0:10]};}
	constraint b_in_C   {b_in 	inside {[10:40]};}
	constraint opcode_c {opcode_in 	inside {[0:11]};}

endclass: Transaction

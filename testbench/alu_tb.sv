`define DATA_WIDTH 8
`define OPCODE_WIDTH 4

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
		$display("TRXN[%0d] :: a_in = 0x%0h, b_in = 0x%1h, opcode_in = 0x%0h", packetCount, a_in, b_in, opcode_in);
	endfunction: displayData
	
	// random constraints
	constraint a_in_C   {a_in 	inside {[0:10]};}
	constraint b_in_C   {b_in 	inside {[10:40]};}
	constraint opcode_c {opcode_in 	inside {[0:11]};}

endclass: Transaction

class Generator;

	Transaction 	trxn;
	mailbox 	mbx;

	function new (mailbox mbx);
		this.mbx = mbx;
	endfunction

	// temporary variable
	localparam totalPacket = 5;
	static int packetCount = 0;

	task run();
		repeat(totalPacket)
		begin
			trxn = new();			// creating new trxn object	

			$display("+----------------------------------STARTOF TRXN  ----------------------------------+");

			trxn.randomize();		// randomizing field values of trxn object

			mbx.put(trxn);			// putting trxn object into the mailbox	

			trxn.displayData(packetCount);	// passing packetCount as argument

			packetCount++;			// incrementing the packetCount



			$display("+----------------------------------ENDOF      TRXN----------------------------------+");
			$display("+                                                                                  +");
		end	

	endtask: run
endclass: Generator

class Driver;

	mailbox   	mbx;
	Transaction 	trxn;

	localparam totalPacket = 5;
	localparam finiteDelay = 10;

	function new (mailbox mbx);
		this.mbx = mbx;
	endfunction

	
	task run();
		repeat(totalPacket)
		begin
			$display("+----------------------------------STARTOF DRIVER----------------------------------+");
			#(finiteDelay)mbx.get(trxn);
			$display("@%0t :: DRIVER :: a_in = 0x%0h, b_in = 0x%0h, opcode_in = 0x%0h", $time, trxn.a_in, trxn.b_in, trxn.opcode_in);
			$display("+----------------------------------ENDOF   DRIVER----------------------------------+");
			$display("+                                                                                  +");
		end
	endtask: run

endclass: Driver

module tb_top();

	mailbox 	mbx;
	Generator 	gen;
	Driver 		drv;


	initial begin
		mbx = new();
		gen = new(mbx);
		drv = new(mbx);

		fork
			gen.run();
			drv.run();
		join_none
	end


endmodule: tb_top


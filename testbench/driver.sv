`ifndef _transaction
`include "./transaction.sv"
`endif

class Driver;

	mailbox   	mbx;
	Transaction 	trxn;

	localparam totalPacket = 5;

	function new (mailbox mbx);
		this.mbx = mbx;
	endfunction

	
	task run();
		repeat(totalPacket)
		begin
			$display("+----------------------------------STARTOF DRIVER----------------------------------+");
			mbx.get(trxn);
			$display("@%0t :: DRIVER :: a_in = 0x%0h, b_in = 0x%0h, opcode_in = 0x%0h", $time, trxn.a_in, trxn.b_in, trxn.opcode_in);
			$display("+----------------------------------ENDOF   DRIVER----------------------------------+");
			$display("+                                                                                  +");
		end
	endtask: run

endclass: Driver

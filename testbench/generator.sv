class Generator;

	Transaction   trxn;
	mailbox 	     mbx;

	function new (mailbox mbx);
		this.mbx = mbx;
	endfunction

	// temporary variable
	localparam totalPacket = 5;
	localparam finiteDelay = 10;
	static int packetCount = 0;

	task run();
		repeat(totalPacket)
		begin
			trxn = new();			            // creating new trxn object	
			$display("+------------------------STARTOF TRXN------------------------+");
			assert(trxn.randomize());		   // randomizing field values of trxn object
			mbx.put(trxn);			            // putting trxn object into the mailbox	
			trxn.displayData(packetCount);	// passing packetCount as argument
			packetCount++;			            // incrementing the packetCount
			#(finiteDelay);
			$display("+-------------------------ENDOF TRXN-------------------------+");
		end	
	endtask: run
endclass: Generator

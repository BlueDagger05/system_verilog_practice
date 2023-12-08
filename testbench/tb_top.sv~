`include "./generator.sv"
`include "./driver.sv"
`include "./interface.sv"

module tb_top();

	mailbox 	mbx;
	Generator 	gen;
	Driver 		drv;

	// connecting interface with DUT defined in the interface
	alu_8bit U0 (alu_ifc.DUT);

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

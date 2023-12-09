`include "C:/Users/niles/OneDrive/sysv_codes/practice/Day03/design/alu_8bit.sv"
//`include "C:/Users/niles/OneDrive/sysv_codes/practice/Day03/testbench/generator.sv"
//`include "C:/Users/niles/OneDrive/sysv_codes/practice/Day03/testbench/driver.sv"
//`include "C:/Users/niles/OneDrive/sysv_codes/practice/Day03/testbench/interface.sv"


module tb_top();
   mailbox     mbx;
   Generator   gen;
   Driver      drv ;
         
   alu_ifc ifc(); // nasty error
   alu_8bit D1 (ifc.DUT);

   initial begin
      mbx = new();
      gen = new(mbx);
      drv = new(mbx);
      fork
         gen.run();
         drv.run();
      join_none
   end
   
   initial begin
      $display("Dry run");
   end
endmodule: tb_top
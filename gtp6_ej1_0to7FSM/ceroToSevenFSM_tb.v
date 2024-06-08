/* `default_nettype net_type: sets the default net type for implicit net declarations, net_type is one of:
   wire, tri, tri0, tri1, triand, trior, trireg, wand, wor, none */
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
// `timescale <time_unit> / <time_precision>
`timescale 100 ns / 10 ns

module ceroToSevenFSM_tb;

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 100;

//-- Clock signal. 
reg clk_test = 0;
always #1 clk_test = ~clk_test;

//-- Test ports declaration
reg reset_test;
wire z_test;

//-- Instantiate the unit to test
ceroToSevenFSM UUT (
         .clk(clk_test),
         .re(reset_test),
         .Salida(z_test)
         );

initial begin
    //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, ceroToSevenFSM_tb);

  #2
  reset_test = 0;

  #2
  reset_test = 1;

  #2
  reset_test = 0; // Notar en el diagrama temporal que la señal reset queda en alto para siempre despues de unos ciclos de clk.

  #(DURATION) $display("End of simulation");
  $finish;
end




endmodule
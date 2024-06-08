/* `default_nettype net_type: sets the default net type for implicit net declarations, net_type is one of:
   wire, tri, tri0, tri1, triand, trior, trireg, wand, wor, none */
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
// `timescale <time_unit> / <time_precision>
`timescale 100 ns / 10 ns

module FSM_ffJK_tb;

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 100;

//-- Clock signal. 
reg clk_test = 0;
always #1 clk_test = ~clk_test;

//-- Test ports declaration
reg reset_test;
wire [1:0] z_test;

//-- Instantiate the unit to test
FSM_ffJK UUT (
         .clk(clk_test),
         .rst(reset_test),
         .Salida(z_test)
         );

initial begin
    //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, FSM_ffJK_tb);
  
  #1
  reset_test = 1;
  #1
  reset_test = 0;

  #5
  reset_test = 1;



  #(DURATION) $display("End of simulation");
  $finish;
end




endmodule
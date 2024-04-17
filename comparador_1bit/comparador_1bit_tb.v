//-------------------------------------------------------------------
//-- comparador_1bit_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module comparador_1bit_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Leds port
wire i0_test, i1_test, eq_test;

//-- Instantiate the unit to test
comparador_1bit UUT (
           .i0(i0_test),
           .i1(i1_test),
           .eq(eq_test)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, comparador_1bit_tb);

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule

//-------------------------------------------------------------------
//-- ej3_gtp2_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano 
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module ej3b_gtp2_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal.
reg clk = 0;
always #0.5 clk = ~clk;

//-- Leds port
reg a_test, b_test, c_test, d_test;
wire r_test;

//-- Instantiate the unit to test
ej3b_gtp2 UUT (
           .a(a_test),
           .b(b_test),
           .c(c_test),
           .d(d_test),
           .R(r_test)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, ej3b_gtp2_tb);

    //Primera tanda de datos para las variables
    a_test = 0;
    b_test = 1;
    c_test = 1;
    d_test = 1;
    # 2; //Duracion del valor de las variables 

    //Segunda tanda de datos para las variables
    a_test = 1;
    b_test = 1;
    c_test = 0;
    d_test = 0;
    # 2; //Duracion del valor de las variables 

    //Tercera tanda de datos para las variables
    a_test = 0;
    b_test = 0;
    c_test = 1;
    d_test = 0;
    # 2; //Duracion del valor de las variables 

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
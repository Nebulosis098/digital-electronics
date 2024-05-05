//-------------------------------------------------------------------
//-- nor_gate_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module nor_gate_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Leds port
reg a_test, b_test, c_test;
wire x_test;

//-- Instantiate the unit to test
nor_gate UUT (
           .A(a_test),
           .B(b_test),
           .C(c_test),
           .X(x_test)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, nor_gate_tb);

    //Primera tanda de datos para las variables
    a_test = 0;
    b_test = 1;
    c_test = 1;
    # 2; //Duracion del valor de las variables

    //Segunda tanda de datos para las variables
    a_test = 1;
    b_test = 1;
    c_test = 0;
    # 2; 

    //Tercera tanda de datos para las variables, esta comb es el unico que arroja 1 en los resultados
    a_test = 0;
    b_test = 0;
    c_test = 0;
    # 2; 

    //Cuerta tanda de datos para las variables
    a_test = 0;
    b_test = 1;
    c_test = 0;
    # 2; 

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule
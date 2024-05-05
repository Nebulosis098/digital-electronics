//-------------------------------------------------------------------
//-- comparador_2bits_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Juan Gonzalez (Obijuan)
//-- Jesus Arroyo Torrens
//-- GPL license
//-------------------------------------------------------------------
`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module comparador_2bits_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- Auxiliar variables for module's ports
wire[1:0] a_test, b_test;
wire s_test;

//-- Instantiate the unit to test
comparador_2bits UUT (
           .a(a_test),
           .b(b_test),
           .salida(s_test)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, comparador_2bits_tb);

  //Simulacion generando patrones de entrada de prueba 
  // test vector 1
  a_test = 2'b00;
  b_test = 2'b00;
  # 200; // ESTO ES IMPORTANTE, nos dice que los valores duraran 200 unidades de tiempo. !!!!!!!!!
  // test vector 2
  a_test = 2'b01;
  b_test = 2'b00;
  # 200;
  // test vector 3
  a_test = 2'b01;
  b_test = 2'b11;
  # 200;
  // test vector 4
  a_test = 2'b10;
  b_test = 2'b10; // Aca deberian ser iguales por ejemplo
  # 200;
  // test vector 5
  a_test = 2'b10;
  b_test = 2'b00;
  # 200;
  // test vector 6
  a_test = 2'b11;
  b_test = 2'b11;
  # 200;
  // test vector 7
  a_test = 2'b11;
  b_test = 2'b01;
  # 200;

   #(DURATION) $display("End of simulation");
  $finish; //Aca detenemos la simulacion
end

endmodule

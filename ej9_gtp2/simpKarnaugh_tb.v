//-------------------------------------------------------------------
//-- simpKarnaugh_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module simpKarnaugh_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// simpKarnaugh ports
reg A0_test, A1_test, A2_test, A3_test;
wire z_test;

simpKarnaugh UUT(
    .A0(A0_test),
    .A1(A1_test),
    .A2(A2_test),
    .A3(A3_test),
    .Z(z_test)
);

integer i;

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, simpKarnaugh_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i); //Esto "Reinicia" el loop de los datos de prueba
        $display ("Current loop # %0b", i); //Esto "Reinicia" el loop de los datos de prueba

        //Primera prueba
        A3_test = 0;
        A2_test = 1;
        A1_test = 1;
        A0_test = 0;
        #2;

        //Segunda prueba
        A3_test = 1;
        A2_test = 0;
        A1_test = 0;
        A0_test = 1;
        #2;
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule
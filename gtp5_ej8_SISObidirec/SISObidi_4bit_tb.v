//-------------------------------------------------------------------
//-- SISObidi_4bit_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module SISObidi_4bit_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// SISObidi_4bit ports
reg rst_test, i_d_test, d_test;
wire q_test;

SISObidi_4bit UUT(
    .clk(clk),
    .rst(rst_test),
    .I_D(i_d_test),
    .Data(d_test),
    .Salida(q_test)
);

integer i;

//Tip para probar TODAS las posibilidades de entrada posibles 
//always #10 {j,k} = 

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, SISObidi_4bit_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        #1
        rst_test = 0;
        i_d_test = 1;
        d_test = 1;
        
        #1
        d_test = 0;

        #1
        d_test = 0;

        #1
        d_test = 0;

        #1
        d_test = 1;

        #1
        rst_test = 1;

        #1
        rst_test = 0;
        d_test = 0;

        #1
        d_test = 0;

        #1
        d_test = 1;

        #1
        i_d_test = 0;
        d_test = 0;

        #1
        d_test = 1;
       
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule
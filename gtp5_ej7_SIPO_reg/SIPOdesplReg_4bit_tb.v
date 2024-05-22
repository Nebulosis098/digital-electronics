//-------------------------------------------------------------------
//-- SIPOdesplReg_4bit_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module SIPOdesplReg_4bit_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// SIPOdespReg_4bit ports
reg d0_test;
wire [3:0] q_test;

SIPOdespReg_4bit UUT(
    .clk(clk),
    .D0(d0_test),
    .Q(q_test)
);

integer i;

//Tip para probar TODAS las posibilidades de entrada posibles 
//always #10 {j,k} = 

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, SIPOdesplReg_4bit_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        #1
        d0_test = 0;

        #1
        d0_test = 1;

        #1
        d0_test = 0;

        #1
        d0_test = 1;
       
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule
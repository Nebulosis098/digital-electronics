//-------------------------------------------------------------------
//-- jk_modificado_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module jk_modificado_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// hamming_emisor ports
reg pr_test, prr_test, j_test, k_test;
wire q_test;

jk_modificado UUT(
    .clk(clk),
    .preset(pr_test),
    .prereset(prr_test),
    .J(j_test),
    .K(k_test),
    .q(q_test)
);

integer i;

//Tip para probar TODAS las posibilidades de entrada posibles 
//always #10 {j,k} = 

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, jk_modificado_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        #2
        pr_test = 1;

        #2
        pr_test = 0;
        prr_test = 0;

        #2
        prr_test = 1;

        #2
        prr_test = 0;
        k_test = 0;

        #2
        j_test = 1;
       
    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule
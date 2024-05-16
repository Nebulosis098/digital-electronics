//-------------------------------------------------------------------
//-- 4bitRegister_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module PIPOreg_4bits_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// 4bitPIPOreg ports
reg [3:0] data_test;
reg load_test;
wire [3:0] q_test;

PIPOreg_4bits UUT(
    .clk(clk),
    .load(load_test),
    .data(data_test),
    .Q(q_test)
);

integer i;

//Tip para probar TODAS las posibilidades de entrada posibles 
//always #10 {j,k} = 

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, PIPOreg_4bits_tb);

    for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        data_test = 4'b1010;
        load_test = 0;

        #2
        load_test = 1;

        #2
        data_test = 4'b0101;
        load_test = 0;

        #2
        data_test = 4'b0101;
        load_test = 1;

    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule
//-------------------------------------------------------------------
//-- ram_tb.v
//-- Testbench
//-------------------------------------------------------------------
//-- Eberhardt Maximiliano
//-- GPL license
//-------------------------------------------------------------------

`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns
// timescale <time_unit> / <time_precision>

module ram_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

// ram ports
reg wr_en_test;
reg [3:0] address_test;
reg [3:0] d_test;
wire [3:0] q_test;

ram16words UUT(
    .clk(clk),
    .we(wr_en_test),
    .address(address_test),
    .write_data(d_test),
    .read_data(q_test)
);

integer i;

//Tip para probar TODAS las posibilidades de entrada posibles 
//always #10 {j,k} = 

initial begin

    //-- File were to store the simulation results
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, ram_tb);

    //for (i=0; i<16; i=i+1)
    begin
        $display ("Current loop # %0d", i);
        $display ("Current loop # %0b", i);

        // Initialize signals
        clk = 0;
        wr_en_test = 0;
        address_test = 4'b0000;
        d_test = 4'b0000;
        
        // Wait for global reset
        #10;
        
        // Test case 1: Write and read from address 0
        wr_en_test = 1;
        address_test = 4'b0000;
        d_test = 4'b1010;
        #10;
        wr_en_test = 0;
        #10;
        if (q_test != 4'b1010) $display("Test case 1 failed");
        
        // Test case 2: Write and read from address 1
        wr_en_test = 1;
        address_test = 4'b0001;
        d_test = 4'b1100;
        #10;
        wr_en_test = 0;
        #10;
        if (q_test != 4'b1100) $display("Test case 2 failed");
        
        // Test case 3: Write and read from address 15
        wr_en_test = 1;
        address_test = 4'b1111;
        d_test = 4'b1111;
        #10;
        wr_en_test = 0;
        #10;
        if (q_test != 4'b1111) $display("Test case 3 failed");
        
        // Additional test cases can be added here
        wr_en_test = 1;
        address_test = 4'b0010;
        d_test = 4'b1011;
        

    end

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule
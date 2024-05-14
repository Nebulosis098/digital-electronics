module FF_D_rst_en (
    input wire en, rst, clk,
    input wire data,
    output reg q
);

//Internal variable declarations

//Body 


//FPGA Prototyping By Verilog implementation, page 87
//Body
always @(posedge clk, posedge rst, posedge en) begin
    if(rst)
        q <= 0;
    else if(en)
        q <= data;
end
    
endmodule
module FF_D_rst (
    input wire clk, rst,
    input wire data,
    output reg q
);

//Internal variables declaration
wire [2:0] concat = {rst, clk, data};
//Body
always @(concat) begin
    case (concat)
        3'b1xx: q <= 0;
        3'b00x: q <= 0;
        3'b010: q <= 0; 
        3'b011: q <= 1;
        default: q <= concat[0];
    endcase
end

//FPGA Prototyping By Verilog implementation, page 87
/*
//Body
always @(posedge clk, posedge rst) begin
    if(rst)
        q <= 0;
    else 
        q <= data;
end
*/
    
endmodule
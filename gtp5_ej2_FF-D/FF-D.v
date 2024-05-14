module FF_D (
    input wire clk, 
    input wire data,
    output reg q
);


//Internal variable declarations
wire [1:0] concat = {clk, data}; // Ojo que esto quizas esta mal, verificar en tb, solo debe mirar el clk el always
//FF-D body
always @(concat) begin
    case (concat)
        2'b0x: q = 0;
        2'b10: q = 0;
        2'b11: q = 1;
        default: q = concat[0]; 
    endcase
end

//Aparentemente ambas soluciones estan bien, solo que la implementacion de arriba parece mas optima dado que es mas instantaneo el cambio 
// producido en la salida q, ver GTK wave para mejor apreciacion

//FPGA Prototyping By Verilog implementation, page 87
//body
/*
always @(posedge clk) begin
    q <= data;
end
*/
    
endmodule
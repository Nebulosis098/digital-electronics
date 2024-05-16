module PIPOreg_4bits (
    input wire clk, load,
    input wire [3:0] data,
    output reg [3:0] Q
);

//Internal variable declaration

//Implementacion usada en la que se resuelve todo en un solo modulo sin hacer instancia de otros modulos.
//Body
always @(posedge clk, posedge load) begin
    if (load) begin
        Q[3] = data[3];
        Q[2] = data[2];
        Q[1] = data[1];
        Q[0] = data[0];
    end
    else begin
        Q[3] = Q[3];
        Q[2] = Q[2];
        Q[1] = Q[1];
        Q[0] = Q[0];
    end
end

endmodule
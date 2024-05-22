module SISObidi_4bit (
    input wire clk, rst,
    input wire I_D,
    input wire Data,
    output reg Salida
);

//Internal variable declaration 
reg [3:0] register = 4'b0000; //Registro interno que representa los 4FF

//Body
always @(posedge rst) begin
    if (rst) begin
        register = 4'b0000;
    end
end

always @(posedge clk, posedge rst) begin
    /*if (rst) begin
        register = 4'b0000;
    end*/

    if (I_D) begin
        register[0] <= Data;
        register[1] <= register[0];
        register[2] <= register[1];
        register[3] <= register[2];
        Salida <= register[3];
    end
    else begin
        register[3] <= Data;
        register[2] <= register[3];
        register[1] <= register[2];
        register[0] <= register[1];
        Salida <= register[0];
    end

end
    
endmodule
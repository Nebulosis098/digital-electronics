module universalReg (
    input wire clk, 
    input wire [1:0] sel,
    input wire [3:0] data,
    output reg [3:0] salida
);

//Internal variables declaration

//Body
always @(posedge clk) begin
    case (sel)
        2'b00: begin
               salida[3] <= salida[2];
               salida[2] <= salida[1];
               salida[1] <= salida[0]; 
               salida[0] <= data[0];
        end
        2'b01: begin    
               salida[3] <= salida[0];  //Deslpazamiento a derecha
               salida[2] <= salida[3];
               salida[1] <= salida[2]; 
               salida[0] <= salida[1];
        end
        2'b10: begin
               salida[1] <= salida[0];  //Deslpazamiento a izquierda     
               salida[2] <= salida[1]; 
               salida[3] <= salida[2];
               salida[0] <= salida[3];  
        end
        default: salida <= data; //Carga paralela, caso 11 en sel
    endcase
end
    
endmodule
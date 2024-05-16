module jk_modificado (
    input wire clk, preset, prereset,
    input wire en, //Señal de control de habilitacion
    input wire  J, K,
    output reg q
);

//Internal variable declarations

//Concatenamos las variables que nos interesan o podemos hacerlo a pata
wire [3:0] pr_prr_jk = {preset, prereset, J, K};

//usar CASEZ para dar prioridad, permite poner signo de pregunta en las condiciones para decir don't cares
//Probar tambien instanciando el ff ya hecho
//Posedge es de positivo, flanco ascendente
//Neg es de negativo, flanco descendente

//Body
always @(posedge clk, posedge preset, posedge prereset) begin
    if (en) begin
        casez (pr_prr_jk)
            4'b1???: q = 1;
            4'b01??: q = 0;
            4'b0010: q = 1;
            4'b0001: q = 0; 
            4'b0011: q = ~q;
            default: q = q;
        endcase 
    end
end
        
endmodule



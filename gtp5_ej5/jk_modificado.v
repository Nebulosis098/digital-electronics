module jk_modificado (
    input wire clk, preset, prereset, J, K,
    output reg q
);

//Internal variable declarations

//Concatenamos las variables que nos interesan o podemos hacerlo a pata
wire [3:0] pr_prr_jk = {preset, prereset, J, K};

//usar CASEZ para dar prioridad, permite poner signo de pregunta en las condiciones para decir don't cares
//Hacer a pata de cero y probar tambien instanciando el ff ya hecho
//Posedge es de positivo, flanco ascendente
//Neg es de negativo, flanco descendente

//Body
always @(clk, preset, prereset) begin
    casez (pr_prr_jk)
        2'b1???: q = 1;
        2'b01??: q = 0;
        2'b0010: q = 1;
        2'b0001: q = 0; 
        2'b0011: q = ~q;
        default: q = q;
    endcase
end
    
endmodule



module ej3b_gtp2 (
    input wire a, b, c, d,
    output wire R 
);

//Declaration of internal variables
wire aux1, aux2, aux3, aux4, aux5, aux6;
wire salida;

//Body
assign aux1 = a | b | ~c | ~d;
assign aux2 = a | ~b | c | ~d;
assign aux3 = a | ~b | ~c | d;
assign aux4 = ~a | b | c | ~d;
assign aux5 = ~a | b | ~c | d;
assign aux6 = ~a | ~b | c | d;

//Asignamos a la salida
assign R = aux1 & aux2 & aux3 & aux4 & aux5 & aux6;
    
endmodule
module FF_JK (
    input wire clk, J, K,
    output reg Q
);

wire [1:0] jk = {J,K}; //Aca estoy concatenando las dos señales y los meto en una nueva señal formada por las señales 
//que concatene

//Internal variable declarations

//Body of flip-flop
//-----------------------------------------------------------------------------------------//
//Siempre que trabajemos que con always adentro debemos manipularn un REG (por eso Q es reg)
//Los conditional  loop errors son pq no tenemos una opcion de DEFAULT en un loop o case's
//-----------------------------------------------------------------------------------------//
always @(posedge clk) begin //Si ponemos el jk dentro del parentesis mira los dos, y solo queremos que mire el clk... 
    case (jk)
        
        2'b11: Q = ~Q;
        2'b01: Q = 0;
        2'b10: Q = 1;
        default: Q = Q;

    endcase
end

    
endmodule
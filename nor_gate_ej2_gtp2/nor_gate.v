module nor_gate (

// Seccion de declaracion de puertos i/o (inputs outputs) que tiene el circuito
    input wire A,
    input wire B,
    input wire C,
    output wire X
);

// Signal declarations -> Internal variables 

wire p0;

//Body: Describe the internal organization of circuit
assign p0 = A | B | C;

assign X = ~p0;
    
endmodule 
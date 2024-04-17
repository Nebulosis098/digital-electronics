module moduleName (

// Seccion de declaracion de puertos i/o (inputs outputs) que tiene el circuito
    input wire A,
    input wire B,
    input wire C,
    output wire X
);

// Signal declarations -> Internal variables 


//Body: Describe the internal organization of circuit
always @() begin

    X <= ~(A | B | C); // PORQUE NO ANDAAAAAA?    

end


    
endmodule 
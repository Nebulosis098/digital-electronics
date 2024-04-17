module comparador_1bit (
    // I/O ports
    input wire i0, i1,
    output wire eq
);

//Signal declarations: Are internal variables
wire p0, p1;

//body
//sum of products terms
assign eq = p0 | p1;

//product terms
assign p0 = ~i0 & ~i1;
assign p1 = i0 & i1;
    
endmodule
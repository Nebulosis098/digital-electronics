// We need to include the comparador_1bit module for use here
`include "comparador_1bit/comparador_1bit.v"

module comparador_2bits (
    input wire [1:0] a, b,
    output wire salida
);

// Internal signal declarations
wire e0, e1;

//body
// Instantiation two 1-bit comparators (previous module)
comparador_1bit comp1 (.i0(a[0]), .i1(b[0]), .eq(e0));
comparador_1bit comp2 (.eq(e1), .i0(a[1]), .i1(b[1]));

// a and b are equals if individual bits are equals
assign salida = e0 & e1;
    
endmodule
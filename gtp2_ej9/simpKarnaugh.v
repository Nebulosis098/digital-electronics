module simpKarnaugh (
    //Refers Guido's example upload to e-fich
    input wire A3, A2, A1, A0,
    output wire Z
);

//Internal variables declaration

//Body
assign Z = (~A3 & ~A1 & ~A0) | (~A3 & A2 & ~A1) | (~A3 & A2 & ~A0) | (~A3 & ~A2 & A1 & A0);
    
endmodule
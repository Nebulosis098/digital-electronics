`include "freqdividerM/freqdividerM.v"

module secuenciarNotas(
    input wire clk, 
    output reg square_wave_final
);

//-- Cables de salida de los divisores de frecuencia de cada nota
wire Do_plus, Do, Re, Mi, Fa, Sol, La, Si, La_numeral;
//-- Selección del canal del multiplexor 
reg [5:0] sel = 0;
//-- Reloj con la duracion de la nota
wire clk2;

// Parametros M para freqdividerM
parameter C_plus = 22944;
parameter C = 45801;
parameter D = 40816;
parameter E = 36363;
parameter F = 34383;
parameter G = 30612;
parameter A = 27272;
parameter B = 24291;
parameter A_numeral = 25751;
parameter freqClk2 = 2800000;

//-- Divisor 0 - Nota +Do
freqdividerM #(C_plus)
  DO_plus (
    .clk(clk),
    .clk_salida(Do_plus)
);

//-- Divisor 1 - Nota Do
freqdividerM #(C)
  DO (
    .clk(clk),
    .clk_salida(Do)
);

//-- Divisor 2 - Nota Re
freqdividerM #(D)
  RE (
    .clk(clk),
    .clk_salida(Re)
);

//-- Divisor 3 - Nota Mi
freqdividerM #(E)
  MI (
    .clk(clk),
    .clk_salida(Mi)
);

//-- Divisor 4 - Nota Fa
freqdividerM #(F)
  FA (
    .clk(clk),
    .clk_salida(Fa)
);

//-- Divisor 5 - Nota Sol
freqdividerM #(G)
  SOL (
    .clk(clk),
    .clk_salida(Sol)
);

//-- Divisor 6 - Nota La
freqdividerM #(A)
  LA (
    .clk(clk),
    .clk_salida(La)
);

//-- Divisor 7 - Nota La#
freqdividerM #(A_numeral)
  A_NUM (
    .clk(clk),
    .clk_salida(La_numeral)
);

//-- Divisor para determinar la duración de cada nota
freqdividerM #(freqClk2)
  CLK2 (
    .clk(clk),
    .clk_salida(clk2)
);

//-- Multiplexor de seleccion del canal de salida
always @*
  case (sel)
     0 : square_wave_final <= Do;
     1 : square_wave_final <= 0;
     2 : square_wave_final <= Do;
     3 : square_wave_final <= 0;
     4 : square_wave_final <= Re;
     5 : square_wave_final <= 0;
     6 : square_wave_final <= Do;
     7 : square_wave_final <= 0;
     8 : square_wave_final <= Fa;
     9 : square_wave_final <= 0;
     10 : square_wave_final <= Mi;
     11 : square_wave_final <= 0;
     12 : square_wave_final <= 0;
     13 : square_wave_final <= Do;
     14 : square_wave_final <= 0;
     15 : square_wave_final <= Do;
     16 : square_wave_final <= 0;
     17 : square_wave_final <= Re;
     18 : square_wave_final <= 0;
     19 : square_wave_final <= Do;
     20 : square_wave_final <= 0;
     21 : square_wave_final <= Sol;
     22 : square_wave_final <= 0;
     23 : square_wave_final <= Fa;
     24 : square_wave_final <= 0;
     25 : square_wave_final <= 0;
     26 : square_wave_final <= Do;
     27 : square_wave_final <= 0;
     28 : square_wave_final <= Do;
     29 : square_wave_final <= 0;
     30 : square_wave_final <= Do_plus;
     31 : square_wave_final <= 0;
     32 : square_wave_final <= La;
     33 : square_wave_final <= 0;
     34 : square_wave_final <= Fa;
     35 : square_wave_final <= 0;
     36 : square_wave_final <= Mi;
     37 : square_wave_final <= 0;
     38 : square_wave_final <= Re;
     39 : square_wave_final <= 0;
     40 : square_wave_final <= 0;
     41 : square_wave_final <= La_numeral;
     42 : square_wave_final <= 0;
     43 : square_wave_final <= La_numeral;
     44 : square_wave_final <= 0;
     45 : square_wave_final <= La;
     46 : square_wave_final <= 0;
     47 : square_wave_final <= Fa;
     48 : square_wave_final <= 0;
     49 : square_wave_final <= Sol;
     50 : square_wave_final <= 0;
     51 : square_wave_final <= Fa;
     default : square_wave_final <= 0;
  endcase

//-- Contador para seleccion de nota
always @(posedge clk2) begin
  sel <= sel + 1;
end

endmodule
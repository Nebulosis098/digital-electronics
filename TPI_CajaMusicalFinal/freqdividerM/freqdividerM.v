module freqdividerM(
    input wire clk,
    output wire clk_salida
);
    
//-- Valor por defecto del divisor , nosotros se lo vamos a tener que pasar por entrada
parameter M = 45801; // Valor de prueba para nota Do
    
//-- Numero de bits para almacenar el divisor
//-- Se calculan con la funcion de verilog $clog2, que nos devuelve el 
//-- numero de bits necesarios para representar el numero M

//-- Es un parametro local, que no se puede modificar al instanciar
localparam N = $clog2(M);
    
//-- Registro para implementar el contador modulo M
reg [N-1:0] contadorParaDividir = 0;
    
//-- Contador módulo M
always @(posedge clk)
  if (contadorParaDividir == M - 1) 
    contadorParaDividir <= 0;
  else 
    contadorParaDividir <= contadorParaDividir + 1;
    
//-- Sacar el bit mas significativo por clk_salida
assign clk_salida = contadorParaDividir[N-1];
    
endmodule
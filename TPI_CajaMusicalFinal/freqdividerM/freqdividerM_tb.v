module freqdividerM_tb();
    
//-- Registro para generar la señal de reloj
reg clk_test = 0;
wire clk_salida_test;
    
//-- Probamos con 5 para que no demore mucho
freqdividerM #(5)
  UUT(
    .clk(clk_test),
    .clk_salida(clk_salida_test)
  );
    
//-- Generador de reloj
always #1 clk_test = ~clk_test;
    
//-- Proceso al inicio
initial begin
    
  //-- Fichero donde almacenar los resultados
  $dumpfile("freqdividerM_tb.vcd");
  $dumpvars(0, freqdividerM_tb);
    
  # 3000 $display("FIN de la simulacion");
  $finish;
end
endmodule
module secuenciarNotas_tb();

//-- Registro para generar la señal de reloj
reg clk_test = 0;

//-- Salidas de los canales
wire square_wave_test;

//-- Se pone un valor bajo para simular (de lo contrario tardaria mucho)
secuenciarNotas UUT(
    .clk(clk_test),
    .square_wave_final(square_wave_test)
  );

//-- Generador de reloj.
always 
  # 1 clk_test <= ~clk_test;

//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("secuenciarNotas_tb.vcd");
  $dumpvars(0, secuenciarNotas_tb);

  # 3000000 $display("FIN de la simulacion");
  $finish;
end

endmodule
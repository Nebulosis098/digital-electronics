module ram16words 
// Parameters
# 
(
parameter b = 4, // words size
          N = 4 // number of registers or addresses 

)

// Ports declarations
(
    input wire clk,
    input wire we, //WriteEnable
    input wire [N-1:0] address,
    input wire [b-1:0] write_data,
    output reg [b-1:0] read_data
);

//Declaracion de contenido de la RAM - Esto es como una matriz
reg [b-1:0] memory [0:N-1]; // En este caso seria una RAM de 16 direcciones en donde se pueden almacenar una palabra de 4 bits 

// 16 palabras de 4 bits cada una => 16 x 4 = 64 bits => 8 Bytes (small)

//Proceso de escritura de la RAM
always @(posedge clk) begin
    if (we) begin //Verifico que wrienable este activo
        memory[address] <= write_data; //Escribe los datos en la direccion
    end
end

//Proceso de lectura de la RAM
//No es necesario que sea sincronico
always @(*) begin
    //
    read_data <= memory[address]; //Lee datos en la direccion indicada
end
    
endmodule

//OJO QUE HAY MUCHA DATA IMPORTANTE PARA ENTENDER EL TEMA EN LAS DIAPOS DE GIOVANINI
//Tema Circuitos Secuenciales
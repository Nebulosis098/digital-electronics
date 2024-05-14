module ram16words (
    input wire clk,
    input wire we, //WriteEnable
    input wire [3:0] address,
    input wire [3:0] write_data,
    output wire [3:0] read_data,
);

//Declaracion de contenido de la RAM
reg [3:0] memory [0:15];

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
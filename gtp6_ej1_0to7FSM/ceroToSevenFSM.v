module ceroToSevenFSM (
    input wire clk,
    input wire re,
    output wire [3:0] Salida
);

// States parameters definition
localparam [3:0] 
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100,
    S5 = 3'b101,
    S6 = 3'b110,
    S7 = 3'b111;

//Internal variables declaration
reg [3:0] state_reg; // Actual state f
reg [3:0] state_next; // Indicates the next state in states logic block

//Body
always @(posedge clk, posedge re) begin
    if(re)begin
        state_reg <= S0;            
    end else begin
        state_reg <= state_next;
    end
end

// States control logic
always @(*) begin
    state_next = state_reg;
    case (state_reg)
        S0: state_next = S1;
        S1: state_next = S2;
        S2: state_next = S3;
        S3: state_next = S4;
        S4: state_next = S5;
        S5: state_next = S6;
        S6: state_next = S7;
        S7: state_next = S0; 
        default: state_next = state_reg;
    endcase

end

assign Salida[3] = state_reg[3];
assign Salida[2] = state_reg[2];
assign Salida[1] = state_reg[1];
assign Salida[0] = state_reg[0];
    
endmodule
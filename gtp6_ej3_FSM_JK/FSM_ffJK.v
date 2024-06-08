module FSM_ffJK (
    input wire clk,
    input wire rst,
    output wire [1:0] Salida
);

// Localparam definition for states
localparam [1:0]
        S0 = 2'b00,
        S2 = 2'b01,
        S4 = 2'b10,
        S6 = 2'b11;

// Internal variables decalration
reg [1:0] state_reg; // Actual state
reg [1:0] state_next;

// Body
// 
always @(posedge clk, posedge rst) begin
    if(rst) begin
        state_reg <= S0;       
    end else begin
        state_reg <= state_next;
    end
end

// Control logic for states 
always @(*) begin
    case (state_reg)
        S0: state_next <= S2;
        S2: state_next <= S4;
        S4: state_next <= S6;
        S6: state_next <= S0;
        default: state_reg = S0; 
    endcase
end

// Output assignation
assign Salida[1] = state_reg[1];
assign Salida[0] = state_reg[0];

endmodule
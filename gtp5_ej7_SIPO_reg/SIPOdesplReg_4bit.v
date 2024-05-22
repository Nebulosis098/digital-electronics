module SIPOdespReg_4bit (
    input wire clk,
    input wire D0,
    output reg [3:0] Q
);

//Internal variable declaration

//Body
always @(posedge clk) begin
    Q[3] = Q[2];
    Q[2] = Q[1];
    Q[1] = Q[0];
    Q[0] = D0;
end
            
endmodule
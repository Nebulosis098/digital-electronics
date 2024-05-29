module FIFO_mem 
#( 
    // Constant variables declaration, to parametizer FIFO size
    parameter B = 4, // Number of bits in a word
              W = 8  // Quantity of words or addresses in the FIFO
 )

(   //Ports declaration
    input wire clk, rst,
    input wire rd, wr,
    input wire [B-1:0] w_data,
    output wire empty, full,
    output wire [B-1:0] r_data 
    
);

//Internal signals declarations

// This implementation works all with internal variables, not assigment data tratment directly to inputs and
// outputs wires. For these reason, it'll necesary create all auxiliaries variables.

//Array_reg (like names indicates) is a array of registers that conform the FIFO memory, in this case
// 8 words or addresses from 4 bits each one.
reg [B-1:0] array_reg [2**W-1 : 0]; // [2**W-1 : 0] indicates the size of the memory, it means how much words of B-1 bits enter into the memory

// ptr_next: 
// ptr_reg: save the position of ptr is actually pointing
reg [W-1:0] w_ptr_reg, w_ptr_next, w_ptr_succ;  
reg [W-1:0] r_ptr_reg, r_ptr_next, r_ptr_succ;

reg full_reg, empty_reg, full_next, empty_next;

wire wr_en;

//body
//register file write operation into array_reg in the w_ptr_reg position
// only if wr_en is enabled
always @(posedge clk) begin
    if(wr_en)
        array_reg[w_ptr_reg] <= w_data;
end

//register file read operation from array_reg at the r_ptr_reg position indicates
// Use assing cause is a input wire variable
assing r_data = array_reg[r_ptr_reg];

//Setting wr_en variable in '1' logic, only when FIFO is not full
assing wr_en = wr & ~full_reg;

//FIFO CONTROL LOGIC
always @(posedge clk, posedge rst) begin
    if (rst) begin
        //We put all reg's to cero
        w_ptr_reg <= 0;
        r_ptr_reg <= 0;
        empty_reg <= 1'b1; 
        full_reg <= 1'b0;
    end 
    else begin
        w_ptr_reg <= w_ptr_next;
        r_ptr_reg <= r_ptr_next;
        full_reg <= full_next;
        empty_reg <= empty_next;
    end
end

//NEXT STATE LOGIC FOR READ AND WRITRE POINTERS PTR's
//Here is the real functionality of FIFO
always @(*) begin
    //successive pointer values
     w_ptr_succ = w_ptr_reg + 1;
     r_ptr_succ = r_ptr_reg + 1;
    
    //default: keep old values
    w_ptr_next = w_ptr_reg;
    r_ptr_next = r_ptr_reg;
    empty_next = empty_reg;
    full_next =  full_reg;

    //cases logic
    case ({wr, rd})
        // 2'b00 no operation
        2'b01: // read
            if(~empty_reg) // not empty
                begin
                    r_ptr_next = r_ptr_succ;
                    full_next 1'b0;
                    if (r_ptr_succ == w_ptr_reg) begin
                        empty_next = 1'b1;
                    end
                end
        2'b10: // write
            if(~full_reg) // not full
                begin
                    w_ptr_next = w_ptr_succ;
                    empty_next = 1'b0;
                    if(w_ptr_succ == r_ptr_reg)
                        full_next = 1'b1;
                end
        2'b11: //write and read
            begin
                w_ptr_next = w_ptr_succ;
                r_ptr_next = r_ptr_succ;
            end 
    endcase
end

// set outputs
assing full = full_reg;
assing empty = empty_reg;

endmodule
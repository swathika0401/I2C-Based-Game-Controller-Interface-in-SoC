module i2c_master_apb ( 
    input clk, 
    input reset, 
    input apb_start, 
    input [6:0] apb_slave_addr, 
    output reg apb_done, 
    output reg [7:0] apb_data_out, 
    output reg scl, 
    inout sda 
); 

    reg [3:0] bit_cnt; 
    reg [7:0] shift_reg; 
    reg [3:0] state; 
    reg sda_out; 
    wire sda_in; 

    assign sda = sda_out ? 1'bz : 1'b0; 
    assign sda_in = sda; 

    localparam IDLE  = 0, 
               START = 1, 
               ADDR  = 2, 
               READ  = 3, 
               STOP  = 4, 
               DONE  = 5; 

    always @(posedge clk or posedge reset) begin 
        if (reset) begin 
            scl <= 1; 
            sda_out <= 1; 
            apb_done <= 0; 
            apb_data_out <= 0; 
            state <= IDLE; 
            shift_reg <= 0;
        end 
        else begin 
            case (state) 

                IDLE: begin 
                    scl <= 1; 
                    sda_out <= 1; 
                    apb_done <= 0; 
                    if (apb_start) 
                        state <= START; 
                end 

                START: begin 
                    sda_out <= 0;   // START condition
                    scl <= 1; 
                    shift_reg <= {apb_slave_addr, 1'b1}; 
                    bit_cnt <= 7; 
                    state <= ADDR; 
                end 

                // -------- ADDRESS PHASE --------
                ADDR: begin 
                    scl <= ~scl;   // Toggle clock

                    if (scl == 0) begin
                        sda_out <= shift_reg[bit_cnt];
                    end 
                    else begin
                        if (bit_cnt == 0) begin 
                            state <= READ; 
                            bit_cnt <= 7; 
                            shift_reg <= 8'b0;   // CLEAR BEFORE READ (IMPORTANT)
                        end 
                        else begin 
                            bit_cnt <= bit_cnt - 1; 
                        end 
                    end
                end 

                // -------- READ PHASE --------
                READ: begin 
                    scl <= ~scl;   // Toggle clock

                    if (scl == 0) begin
                        sda_out <= 1'b1;   // Release SDA
                    end 
                    else begin
                        // MSB first shifting
                        shift_reg[bit_cnt] <= sda_in;

                        if (bit_cnt == 0) begin 
                            apb_data_out <= shift_reg; 
                            state <= STOP; 
                        end 
                        else begin 
                            bit_cnt <= bit_cnt - 1; 
                        end 
                    end
                end 

                STOP: begin 
                    scl <= 1; 
                    sda_out <= 1;   // STOP condition
                    state <= DONE; 
                end 

                DONE: begin 
                    apb_done <= 1; 
                    state <= IDLE; 
                end 

            endcase 
        end 
    end 
endmodule

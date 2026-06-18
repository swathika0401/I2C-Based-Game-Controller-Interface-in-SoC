module i2c_game_controller_slave ( 
    input clk, 
    input reset, 
    input scl, 
    inout sda, 
    input [7:0] button_state 
); 

    reg [3:0] bit_cnt; 
    reg [7:0] data_out; 
    reg sda_drive; 
    reg sda_reg; 

    // IMPORTANT: Drive SDA properly
    assign sda = sda_drive ? sda_reg : 1'bz;

    always @(posedge scl or posedge reset) begin 
        if (reset) begin 
            data_out <= button_state; 
            bit_cnt <= 7; 
            sda_drive <= 0; 
            sda_reg <= 1'b1; 
        end 
        else begin 
            sda_drive <= 1; 
            sda_reg <= data_out[bit_cnt];

            if (bit_cnt == 0) 
                bit_cnt <= 7; 
            else 
                bit_cnt <= bit_cnt - 1; 
        end 
    end 
endmodule

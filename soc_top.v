module soc_top (
    
    input clk,
    input reset,
    input apb_start,
    input [6:0] slave_addr,
    input [7:0] controller_buttons,
    output [7:0] button_status,
    output scl,
    inout sda
);
    wire apb_done;
    wire [7:0] data_out;

    i2c_master_apb master (
        .clk(clk),
        .reset(reset),
        .apb_start(apb_start),
        .apb_slave_addr(slave_addr),
        .apb_done(apb_done),
        .apb_data_out(data_out),
        .scl(scl),
        .sda(sda)
    );

    i2c_game_controller_slave slave (
        .clk(clk),
        .reset(reset),
        .scl(scl),
        .sda(sda),
        .button_state(controller_buttons)
    );

    assign button_status = data_out;
endmodule

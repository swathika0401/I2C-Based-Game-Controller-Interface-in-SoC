`timescale 1ns/1ps

module testbench;
    reg clk = 0, reset = 0, apb_start = 0;
    wire scl;
    wire sda;
  reg [6:0] slave_addr = 7'b1000010; // example I2C address
    reg [7:0] controller_buttons = 8'b10101100;
    wire [7:0] button_status;

    soc_top dut (
        .clk(clk),
        .reset(reset),
        .apb_start(apb_start),
        .slave_addr(slave_addr),
        .controller_buttons(controller_buttons),
        .button_status(button_status),
        .scl(scl),
        .sda(sda)
    );

    always #5 clk = ~clk; // 100MHz clock

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, testbench);

        reset = 1;
        #10 reset = 0;

        #20;
        apb_start = 1;
        #10;
        apb_start = 0;

        #100;
        $display("Button Status Read: %b", button_status);

        $finish;
    end
endmodule

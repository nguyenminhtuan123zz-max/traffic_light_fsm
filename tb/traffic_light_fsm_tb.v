`timescale 1ns/1ps

module traffic_light_fsm_tb;

    reg clk;
    reg rst_n;
    wire red;
    wire yellow;
    wire green;

    // Instantiate DUT
    traffic_light_fsm dut (
        .clk(clk),
        .rst_n(rst_n),
        .red(red),
        .yellow(yellow),
        .green(green)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 0;

        // Apply reset
        #12;
        rst_n = 1;

        // Run simulation
        #200;
        $finish;
    end

    initial begin
        $display("Time\tclk\trst_n\tred\tyellow\tgreen");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b",
                 $time, clk, rst_n, red, yellow, green);
    end

endmodule

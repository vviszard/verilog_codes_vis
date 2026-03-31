`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2026 04:04:24 PM
// Design Name: 
// Module Name: mul_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mul_test();
reg [15:0] a, q;
    reg clk, start;

    wire done;
    wire [32:0] P;

    multiplier dut (
        .P(P), 
        .done(done), 
        .start(start), 
        .a(a), 
        .q(q), 
        .clk(clk)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        a = 16'd11;
        q = 16'd13;
        start = 0;
        
        #20;
        
        @(posedge clk);
        start = 1;
        @(posedge clk);
        start = 0;

        wait(done);
        
        #5; 
        $display("Calculation Finished!");
        $display("Input A: %d, Input Q: %d", a, q);
        $display("Result P: %d (Binary: %b)", P, P);
        #20;
        $finish;
    end
      
endmodule

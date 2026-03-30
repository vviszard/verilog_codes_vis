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

    // Outputs
    wire done;
    wire [32:0] P;

    // Instantiate your multiplier
    multiplier uut (
        .P(P), 
        .done(done), 
        .start(start), 
        .a(a), 
        .q(q), 
        .clk(clk)
    );

    // Generate Clock: 10ns period (100MHz)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // 1. Initialize
        a = 16'd11;     // Multiplicand
        q = 16'd13;     // Multiplier
        start = 0;
        
        #20;            // Wait a bit
        
        // 2. Pulse Start for one clock cycle
        @(posedge clk);
        start = 1;
        @(posedge clk);
        start = 0;

        // 3. Wait for the 'done' signal
        wait(done);
        
        // 4. Display result
        #5; 
        $display("Calculation Finished!");
        $display("Input A: %d, Input Q: %d", a, q);
        $display("Result P: %d (Binary: %b)", P, P);
        
        if (P == 143) 
            $display("SUCCESS: 11 * 13 = 143");
        else 
            $display("FAILURE: Expected 143, got %d", P);

        #20;
        $finish;        // Stop the simulation
    end
      
endmodule

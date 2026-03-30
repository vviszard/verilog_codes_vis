`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Vishwas Paliwal 
// 
// Create Date: 03/30/2026 11:29:12 AM
// Design Name: 
// Module Name: multiplier
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


module multiplier(P,done,start,a,q,clk);
    input [15:0] a,q;
    input clk,start;
    output reg done;
    output reg [32:0] P;

    reg [15:0] M;
    reg [32:0] R;
    integer n;

    always @(posedge clk)
        if (start)
        begin
            M <= a;
            R[15:0] <= q;
            R[31:16] <= 16'b0;
            n <= 16;
            done <= 1'b0;
        end   
  
        else if (n > 0)
            begin
                if (R[0])
                    begin
                        R <= {1'b0,(R[31:16]+M),R[15:1]};
                        n <= n - 1;
                    end
                else if (!R[0])
                    begin
                        R <= {1'b0,R[32:1]};
                        n <= n - 1;
                    end
                end
        else if (n == 0)
            begin
                P <= R;
                done <= 1'b1;
            end
endmodule

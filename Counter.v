`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 12:59:49 PM
// Design Name: 
// Module Name: Counter
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


module Counter(
    input clk,
    input reset_n,
    input [6:0] final_value,
    output done,
    output done1
    );
    reg [6:0] counts,counts_next;
    always @(posedge clk , negedge reset_n)
    begin
        if(~reset_n)
            counts <= 0;
        else
            counts <= counts_next;  
    end
    always@(*) begin
        if(~done)
            counts_next = counts +1;
        else
            counts_next = counts;
    end
    assign done = counts == final_value;
    assign done1 = counts > 1 || counts == 1;
endmodule

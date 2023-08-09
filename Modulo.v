`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 12:38:04 PM
// Design Name: 
// Module Name: Modulo
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


module Modulo(
    input start,
    input [17:0] A,
    input clk,
    input cntdone,
    output reg rst_counter,
    output reg [5:0] Data
    );
    reg [8:0] memory [0:2**18-2**12-1];
    reg [5:0] data_next;
    initial
        $readmemb("mod.mem",memory);
    always @(posedge clk)
        Data <= data_next;
        always @(*)
    begin
        rst_counter = 1;
        if(start)
            rst_counter = 0;
        if(cntdone || start)
            data_next = Data;
        else
            data_next = memory[A];
    end

endmodule

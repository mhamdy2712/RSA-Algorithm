`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 01:30:50 PM
// Design Name: 
// Module Name: top
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


module RSA (
    input Start,clk,
    input [5:0] Data,
    input [5:0] Key,
    input [5:0] N,
    output Done,
    output [5:0] Result
    );
    wire [5:0] regResult,Mult1;
    wire [11:0] Mult_out;
    wire [17:0] A;
    assign A = {N-1,Mult_out};
    wire done1,cntdone,rst_counter;
    assign Result = regResult;
    assign Done = cntdone;
    MUX  m(
    .In1(Data),
    .In2(regResult),
    .sel(done1),
    .out(Mult1)
    );
    Multiplier M (
    .A(Mult1),
    .B(Data),
    .C(Mult_out)
    );
    Modulo  n2(
    .A(A),
    .clk(clk),
    .Data(regResult),
    .rst_counter(rst_counter),
    .start(Start),
    .cntdone(cntdone)
    );
    //register myreg (
    //.clk(clk),
    //.start(Start),
    //.Data_in(Modulo_out),
    //.Data_out(regResult),
    //.cntdone(cntdone),
   // .rst_counter(rst_counter),
   // .done(Done)
  //  );
    Counter C (
    .clk(clk),
    .reset_n(rst_counter),
    .final_value(Key-1),
    .done(cntdone),
    .done1(done1)
    );
endmodule

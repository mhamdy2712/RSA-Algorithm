`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/08/2023 02:09:29 PM
// Design Name: 
// Module Name: RSA_tb
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


module RSA_tb(

    );
    parameter clk_period =20;
    reg clk = 0;
	always #(clk_period/2) clk = ~ clk;
	reg start_tb;
	reg [5:0] data_tb,N_tb,key_tb;
	wire[5:0] result_tb;
	wire Done_tb;
	
	RSA my_top (
    .Start(start_tb), 
    .clk(clk),
    .Data(data_tb), 
    .N(N_tb), 
    .Key(key_tb), 
    .Result(result_tb), 
    .Done(Done_tb)
    );
	 
	initial begin
		start_tb = 1;
		data_tb = 6'b101011;
		N_tb = 6'b010100;
		key_tb = 6'b001010;
		#(3*clk_period);
		start_tb = 0;
		#(70*clk_period);
        start_tb = 1;
		data_tb = 40;
		N_tb = 36;
		key_tb = 15;
		#(3*clk_period);
		start_tb = 0;
		#(30*clk_period);

	end

endmodule


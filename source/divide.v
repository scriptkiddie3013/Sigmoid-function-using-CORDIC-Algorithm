`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 18:53:18
// Design Name: 
// Module Name: divide
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


module divide(output [16:0]out,
              input [15:0]num,den
    );
wire [1:0]shift;

shift s1( den,shift );

wire [15:0]num_dum = num>>shift;
wire [15:0]den_dum = den>>shift;

wire [33:0]dum = ~(17'b0011110100000101*{1'b0,den})+1;
wire [16:0]x0 = dum[30:14] + 17'b010_11010000111110;//*

wire [63:0]xi_dum;
wire [33:0]xi1_dum[3:0];
wire [33:0]xi2_dum[3:0];

wire [16:0]d = {1'b0,den_dum};

assign xi1_dum[3] = d*x0;

assign xi1_dum[0] = 34'd536870912 - ({1'b0,den_dum}*x0);
assign xi2_dum[0] =  xi1_dum[0][30:14]*x0;

assign xi1_dum[1] = 34'd536870912 - ({1'b0,den_dum}*xi2_dum[0][30:14]);
assign xi2_dum[1] =  xi1_dum[1][30:14]*xi2_dum[0][30:14];

assign xi1_dum[2] = 34'd536870912 - ({1'b0,den_dum}*xi2_dum[1][30:14]);
assign xi2_dum[2] =  xi1_dum[2][30:14]*xi2_dum[1][30:14];

assign xi_dum = num_dum*xi2_dum[2][30:14];
assign out = {1'b0,xi_dum[29:14]};
endmodule

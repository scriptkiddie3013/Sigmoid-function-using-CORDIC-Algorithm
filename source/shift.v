`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 18:54:23
// Design Name: 
// Module Name: shift
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


module shift( input [15:0]den,
              output reg [1:0]shift
    );
    
wire [15:0]shifter[2:0];

assign shifter[0] = den>>1;
assign shifter[1] = den>>2;
always @(*)
begin
    if(shifter[0]>8192 && shifter[0]<16384)
    shift = 1;
    else if(shifter[0]>8192 && shifter[0]<16384)
    shift = 2;
end
endmodule

module PE(in, acc, w, out, resetn,clk);
input signed [7:0] in, acc, w;
output signed [7:0] out;
input clk , resetn;

wire signed [15:0] mult;
wire signed [16:0] mult_acc;

assign mult = in * w;
assign mult_acc = mult + acc;
assign out = mult_acc[7:0];

endmodule 

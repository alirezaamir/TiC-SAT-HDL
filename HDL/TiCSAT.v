module TiCSAT(tic_in, tic_out, command, col, resetn, clk);
input  [31:0] tic_in;
input [1:0] command;
input [1:0] col;
output [31:0] tic_out;
input clk , resetn;

wire signed [7:0] FIFO_SA_in0, FIFO_SA_in1, FIFO_SA_in2, FIFO_SA_in3, FIFO_SA_in4, FIFO_SA_in5, FIFO_SA_in6, FIFO_SA_in7, FIFO_SA_in8, FIFO_SA_in9, FIFO_SA_in10, FIFO_SA_in11, FIFO_SA_in12, FIFO_SA_in13, FIFO_SA_in14, FIFO_SA_in15, FIFO_SA_out0, FIFO_SA_out1, FIFO_SA_out2, FIFO_SA_out3, FIFO_SA_out4, FIFO_SA_out5, FIFO_SA_out6, FIFO_SA_out7, FIFO_SA_out8, FIFO_SA_out9, FIFO_SA_out10, FIFO_SA_out11, FIFO_SA_out12, FIFO_SA_out13, FIFO_SA_out14, FIFO_SA_out15;

SA SA_main (.w_input(tic_in), 
.input0(FIFO_SA_in0), .input1(FIFO_SA_in1), .input2(FIFO_SA_in2), .input3(FIFO_SA_in3), .input4(FIFO_SA_in4), .input5(FIFO_SA_in5), .input6(FIFO_SA_in6),
 .input7(FIFO_SA_in7), .input8(FIFO_SA_in8), .input9(FIFO_SA_in9), .input10(FIFO_SA_in10), .input11(FIFO_SA_in11), .input12(FIFO_SA_in12), .input13(FIFO_SA_in13),
  .input14(FIFO_SA_in14), .input15(FIFO_SA_in15),
.output0(FIFO_SA_out0), .output1(FIFO_SA_out1), .output2(FIFO_SA_out2), .output3(FIFO_SA_out3), .output4(FIFO_SA_out4), .output5(FIFO_SA_out5), .output6(FIFO_SA_out6), 
.output7(FIFO_SA_out7), .output8(FIFO_SA_out8), .output9(FIFO_SA_out9), .output10(FIFO_SA_out10), .output11(FIFO_SA_out11), .output12(FIFO_SA_out12), .output13(FIFO_SA_out13), 
.output14(FIFO_SA_out14), .output15(FIFO_SA_out15),
.command(command), .col(col), .resetn(resetn),.clk(clk));

FIFO_in FIFO_in_main(.input0(tic_in), 
.output0(FIFO_SA_in0), .output1(FIFO_SA_in1), .output2(FIFO_SA_in2), .output3(FIFO_SA_in3), .output4(FIFO_SA_in4), .output5(FIFO_SA_in5), .output6(FIFO_SA_in6), 
.output7(FIFO_SA_in7), .output8(FIFO_SA_in8), .output9(FIFO_SA_in9), .output10(FIFO_SA_in10), .output11(FIFO_SA_in11), .output12(FIFO_SA_in12), .output13(FIFO_SA_in13), 
.output14(FIFO_SA_in14), .output15(FIFO_SA_in15), 
.command(command), .col(col), .resetn(resetn),.clk(clk));

FIFO_out FIFO_out_main(.input0(FIFO_SA_out15), .input1(FIFO_SA_out14), .input2(FIFO_SA_out13), .input3(FIFO_SA_out12), .input4(FIFO_SA_out11), .input5(FIFO_SA_out10), .input6(FIFO_SA_out9),
 .input7(FIFO_SA_out8), .input8(FIFO_SA_out7), .input9(FIFO_SA_out6), .input10(FIFO_SA_out5), .input11(FIFO_SA_out4), .input12(FIFO_SA_out3), .input13(FIFO_SA_out2), 
 .input14(FIFO_SA_out1), .input15(FIFO_SA_out0),
 .output0(tic_out),
.command(command), .col(col), .resetn(resetn),.clk(clk));


endmodule 

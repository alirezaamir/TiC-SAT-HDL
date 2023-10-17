`timescale 1ns/1ns
module TicSATTest;
reg [31:0]tic_in;
wire [1:0] command;
reg [1:0] col;
reg clk,resetn;
wire [31:0]tic_out;

reg send_data;


TiCSAT TiCSAT_DUT(.tic_in(tic_in), .tic_out(tic_out), .command(command), .col(col), .resetn(resetn),.clk(clk));
integer file;

initial 
begin
 clk=1'b0;
 resetn = 0;
 send_data = 0;
 #26 resetn = 1;
 
 @(posedge clk);
 tic_in = 32'h_11011202;
 
 # 2560 // 64 clock cycle is enough
 send_data = 1;
 # 1626 // 64 clock cycle is enough
 tic_in = 32'h_00010003;
 
end

always 
#5 clk<=~clk;

assign command = (send_data && col == 2'b11) ? 2'b10 : (send_data ? 2'b01 : 2'b00); 


always @(posedge clk)
begin
	if (!resetn)
		col <= 0;
	else
		col <= col +1; 
end


always
begin
	@(posedge clk)
		$display("Output %d \n"  , tic_out);
end

endmodule

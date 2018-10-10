`timescale 1 ns / 1 ps
`include "register32.v"

module testRegister32();
	wire[31:0] test_q;
	reg test_clk;
	reg test_en;
	reg[31:0] test_d;

	register32zero reg32(
		.q(test_q),
		.d(test_d),
		.wrenable(test_en),
		.clk(test_clk));

initial begin
	$dumpfile("reg32.vcd");
	$dumpvars();
	test_clk = 0;
	test_d   = 32'h10101010;
	test_en  = 1; #5;
	test_clk = 1; #5;
	test_clk = 0;
	test_d = 32'h10000000; #5;
	test_clk = 1; #5;
	test_clk = 0;
	test_d   = 32'h10101010;
	test_en  = 0; #5;
	test_clk = 1; #5;
	test_clk = 0;
	test_d = 32'h00000000; #5;
	test_clk = 1; #5;
end // initial
endmodule // testRegister32

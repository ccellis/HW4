`timescale 1 ns / 1 ps
`include "mux32.v"

module testMux32();
	reg[31:0] test_in;
	reg[4:0] test_sel;
	wire test_out;

	mux32to1by1 testMux(.out(test_out),.address(test_sel),.inputs(test_in));

initial begin
	$dumpfile("mux.vcd");
	$dumpvars();

	test_in = 32'hAAAAAAAA; //1010101010...10
	test_sel = 5'b00000; //0
	#5;
	test_sel=5'b00001; //1
	#5;
	test_sel=5'b00010; //0
	#5;
	test_sel=5'b11111; //1
	#5;
	test_sel=5'b11110; //0
	#5;
	test_in = 32'h55555555; //01010101010...01
	test_sel = 5'b00000; //1
	#5;
	test_sel=5'b00001; //0
	#5;
	test_sel=5'b00010; //1
	#5;
	test_sel=5'b11111; //0
	#5;
	test_sel=5'b11110; //1
	#5;
end

endmodule // testMux32
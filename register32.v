module register32
(
output reg [31:0] q,
input      [31:0] d,
input       wrenable,
input       clk
);
	always @(posedge clk) begin
		if(wrenable) begin
			q[31:0] <= d[31:0];
		end // if(wrenable)
	end // always @(posedge clk)
endmodule

module register32zero
(
output reg [31:0] q,
input      [31:0] d,
input       wrenable,
input       clk
);
integer i;
	always @(posedge clk) begin
		if(wrenable) begin
			q[31:0] <= 32'h00000000;
		end // if(wrenable)
	end // always @(posedge clk)
endmodule
//------------------------------------------------------------------------------
// MIPS register file
//   width: 32 bits
//   depth: 32 words (reg[0] is static zero register)
//   2 asynchronous read ports
//   1 synchronous, positive edge triggered write port
//------------------------------------------------------------------------------
`timescale 1 ns / 1 ps
`include "mux32.v"
`include "register32.v"
`include "decoders.v"

module regfile
(
output[31:0]	ReadData1,	// Contents of first register read
output[31:0]	ReadData2,	// Contents of second register read
input[31:0]	WriteData,	// Contents to write to register
input[4:0]	ReadRegister1,	// Address of first register to read
input[4:0]	ReadRegister2,	// Address of second register to read
input[4:0]	WriteRegister,	// Address of register to write
input		RegWrite,	// Enable writing of register when High
input		Clk		// Clock (Positive Edge Triggered)
);
	wire[31:0] decoder_out;
	wire[31:0] reg_out[31:0];

	decoder1to32 decoder(.out(decoder_out),.enable(RegWrite),.address(WriteRegister));

	register32zero reg0(.d(WriteData),.q(reg_out[0]),.wrenable(decoder_out[0]),.clk(Clk));

	genvar i;
	generate
		for(i = 1; i < 32; i = i+1)
		begin:genblock
			register32 reg32( 
				.d(WriteData), 
				.q(reg_out[i]), 
				.wrenable(decoder_out[i]),
				.clk(Clk));
		end
	endgenerate

	mux32to1by32 mux1(
		.out(ReadData1),
		.address(ReadRegister1),
		.input0( reg_out[0]),
		.input1( reg_out[1]),
		.input2( reg_out[2]),
		.input3( reg_out[3]),
		.input4( reg_out[4]),
		.input5( reg_out[5]),
		.input6( reg_out[6]),
		.input7( reg_out[7]),
		.input8( reg_out[8]),
		.input9( reg_out[9]),
		.input10(reg_out[10]),
		.input11(reg_out[11]),
		.input12(reg_out[12]),
		.input13(reg_out[13]),
		.input14(reg_out[14]),
		.input15(reg_out[15]),
		.input16(reg_out[16]),
		.input17(reg_out[17]),
		.input18(reg_out[18]),
		.input19(reg_out[19]),
		.input20(reg_out[20]),
		.input21(reg_out[21]),
		.input22(reg_out[22]),
		.input23(reg_out[23]),
		.input24(reg_out[24]),
		.input25(reg_out[25]),
		.input26(reg_out[26]),
		.input27(reg_out[27]),
		.input28(reg_out[28]),
		.input29(reg_out[29]),
		.input30(reg_out[30]),
		.input31(reg_out[31]));

	mux32to1by32 mux2(
		.out(ReadData2),
		.address(ReadRegister2),
		.input0( reg_out[0]),
		.input1( reg_out[1]),
		.input2( reg_out[2]),
		.input3( reg_out[3]),
		.input4( reg_out[4]),
		.input5( reg_out[5]),
		.input6( reg_out[6]),
		.input7( reg_out[7]),
		.input8( reg_out[8]),
		.input9( reg_out[9]),
		.input10(reg_out[10]),
		.input11(reg_out[11]),
		.input12(reg_out[12]),
		.input13(reg_out[13]),
		.input14(reg_out[14]),
		.input15(reg_out[15]),
		.input16(reg_out[16]),
		.input17(reg_out[17]),
		.input18(reg_out[18]),
		.input19(reg_out[19]),
		.input20(reg_out[20]),
		.input21(reg_out[21]),
		.input22(reg_out[22]),
		.input23(reg_out[23]),
		.input24(reg_out[24]),
		.input25(reg_out[25]),
		.input26(reg_out[26]),
		.input27(reg_out[27]),
		.input28(reg_out[28]),
		.input29(reg_out[29]),
		.input30(reg_out[30]),
		.input31(reg_out[31]));




endmodule
module datapath(input logic clk, reset,
		input logic [1:0] ResultSrc,
		input logic PCSrc, ALUSrc,
		input logic RegWrite,
		input logic [1:0] ImmSrc,
		input logic [31:0] Instr,
		input logic [31:0] ReadData,
		input logic [2:0] ALUControl,
		output logic Zero,
		output logic [31:0] PC,
		output logic [31:0] ALUResult, WriteData);

	logic [31:0] PCNext, PCPlus4, PCTarget;
	logic [31:0] ImmExt;
	logic [31:0] SrcA, SrcB;
	logic [31:0] Result;

	// next PC logic
	flopr #(32) pcreg(clk, reset, PCNext, PC);
	adder       pcadd4(PC, 32'd4, PCPlus4);
	adder       pcaddbranch(PC, ImmExt, PCTarget);
	mux2 #(32)  pcmux(PCPlus4, PCTarget, PCSrc, PCNext);

	// register file logic レジスタファイルの引数怪しい
	regfile rf(clk, RegWrite, Instr[19:15], Instr[24:20], Instr[11:7], WriteData, Result, SrcA);
	extend  ext(Instr[31:0], ImmSrc, ImmExt);

	// ALU logic
	mux2 #(32) srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
	alu        alu(SrcA, SrcB, ALUControl, Zero, ALUResult);
	mux3 #(32) resultmux(ALUResult, ReadData, PCPlus4, ResultSrc, WriteData);
endmodule

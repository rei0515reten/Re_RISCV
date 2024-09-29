module riscvpipeline(input logic Clk, reset,
		input logic [31:0] Instr,
		input logic [31:0] ReadData,
		output logic [31:0] PC,
		output logic MemWrite,
		output logic [31:0] ALUResult, WriteData);
	
	logic ALUSrc, RegWrite, Jump, Zero;
	logic [1:0] ResultSrc, ImmSrc;
	logic [2:0] ALUControl;

	//Instantiate controller
	//Instantiate datapath
endmodule


module top(input logic Clk, reset,
	output logic [31:0] WriteData, DataAdr,
	output logic MemWrite);

	logic [31:0] PC, Instr, ReadData;

	//instantiate riscvpipeline processor
	
	imem imem(PC,Instr);
	dmem dmem(Clk, MemWrite, DataAdr, WriteData, ReadData);
endmodule

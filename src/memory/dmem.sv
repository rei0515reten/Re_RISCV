module dmem(input logic Clk, we,
	input logic [31:0] a, wd,
	output logic [31:0] rd);

	logic [31:0] RAM[63:0];

	assign rd = RAM[a[31:2]];

	always_ff @(posedge Clk)
		if(we) RAM[a[31:2]] <= wd;
endmodule

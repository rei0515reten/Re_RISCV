//即値を32bitにゼロ拡張する
module extend(input logic [31:0] instr,
	input logic [1:0] immsrc,
	output logic [31:0] immext);

	logic [31:0] i;
	always_comb
		case(immsrc)
			//I-type
			2'b00: i = {{20{instr[31]}}, instr[31:20]};
			//2'b00: i = instr[31:20];
			//S-type(stores)
			//2'b01: i = {{20{instr[31]}}, instr[31:25], instr[11:7]};
			//B-type(branches)
			//2'b10: i = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
			//J-type(jal)
			//2'b11: i = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
			//undefined
			default: i = 32'bx;
		endcase
endmodule

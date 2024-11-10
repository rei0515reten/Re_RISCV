//即値を32bitにゼロ拡張する
module extend(input logic [31:0] instr,
	input logic [1:0] immsrc,
	output logic [31:0] immext);

	//どうやらicarusVerilogだとalways_*の中で配線の部分指定ができない
	//らしいので各配線に代入してから使うことにする。
	//wireをreg、逆もしかりでこういう代入、配線しようとすると失敗するため
	//型は合わせる。
	//logicは、代入する場所や代入する型によってwireやregになるため注意。
	wire [11:0] instr31_20 	= instr[31:20];
	wire instr31 		= instr[31];
	wire instr7 		= instr[7];
	wire instr20 		= instr[20];
	wire [6:0] instr31_25 	= instr[31:25];
	wire [4:0] instr11_7 	= instr[11:7];
	wire [5:0] instr30_25 	= instr[30:25];
	wire [3:0] instr11_8 	= instr[11:8];
	wire [7:0] instr19_12 	= instr[19:12];
	wire [9:0] instr30_21 	= instr[30:21];

	always_comb
		case(immsrc)
			//I-type
			2'b00: immext = {{20{instr31}}, instr31_20};
			//S-type(stores)
			2'b01: immext = {{20{instr31}}, instr31_25, instr11_7};
			//B-type(branches)
			2'b10: immext = {{20{instr31}}, instr7, instr30_25, instr11_8, 1'b0};
			//J-type(jal)
			2'b11: immext = {{12{instr31}}, instr19_12, instr20, instr30_21, 1'b0};
			//undefined
			default:immext = 32'bx;
		endcase
endmodule

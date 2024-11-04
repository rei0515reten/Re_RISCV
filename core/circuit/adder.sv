module adder(input[31:0] a,
	input[31:0] b,
	//input[31:0] x,
	output[31:0] out);

	//x→繰り上がり
	//assign out = a + b + x;
	assign out = a + b;
endmodule

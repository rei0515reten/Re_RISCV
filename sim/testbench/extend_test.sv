`timescale 1ns/1ps

module extend_test();
	logic Clk, reset;
	logic [31:0] instr, immext;
	logic [1:0] immsrc;

	extend _ex(instr, immsrc, immext);
	always #1 Clk = ~Clk;

	initial begin
		Clk = 0;
		reset = 0;
		instr = 32'b1;
		immsrc = 2'b00;
		#1
		reset = 1;
		instr = 32'b10000000000000000000000000000000;
		immsrc = 2'b00;
		#2	
		instr = 32'b10000000000000000000000000000000;
		immsrc = 2'b01;
		#2
		//instr = 32'b1;
		instr = 32'b10000000000000000000000000000000;
		immsrc = 2'b10;
		#2
		//instr = 32'b1;
		instr = 32'b10000000000000000000000000000000;
		immsrc = 2'b11;
		#2
		reset = 0;
		#2
		$finish;
	end

	initial begin
		$monitor("immsrc=%b instr=%b immext=%b", immsrc, instr, immext);
		$dumpfile("extend.vcd");
		$dumpvars(0, _ex);
		$dumpvars(0, Clk);
		$dumpvars(0, reset);
	end
endmodule

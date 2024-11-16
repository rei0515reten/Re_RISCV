`timescale 1ns/1ps

module adder_test();
	logic Clk,reset;
	logic[31:0] a;
	logic[31:0] b;
	logic[31:0] x;
	logic[31:0] sum;

	adder _ad(a,b,x,sum);
	always #1 Clk = ~Clk;

	initial begin
		reset = 1;
		Clk = 0;
		//↓ちゃんと初期化してあげないと動かない
		a = 0;
		b = 0;
		x = 0;
		#2
		a = 1;
		b = 0;
		x = 0;
		#2
		a = 0;
		b = 1;
		x = 0;
		#2
		a = 1;
		b = 1;
		x = 0;
		#2
		a = 0;
		b = 0;
		x = 1;
		#2
		a = 1;
		b = 0;
		x = 1;
		#2
		a = 0;
		b = 1;
		x = 1;
		#2
		a = 1;
		b = 1;
		x = 1;
		#2
		reset = 0;
		#2
		$finish;
	end

	initial begin
		$monitor("sum=%d",sum);
		$dumpfile("adder.vcd");
		$dumpvars(0,sum);	
	end
endmodule

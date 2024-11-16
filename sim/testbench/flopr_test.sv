`timescale 1ns/1ps

module flopr_test();
	logic Clk,reset;
	logic[31:0] data,result;

	flopr _fl(Clk,reset,data,result);
	always #1 Clk = ~Clk;

	initial begin
		Clk = 1;   //クロック立ち上がりで処理されるため、クロックをはじめのうちに立ち上げておかないと処理がされないためresultに数値が入らない
		data = 0;
		#2
		data = 1;
		#2
		data = 10;
		#2
		data = 12;
		#2
		reset = 1;
		#2
		data = 13;
		#2
		$finish;
	end

	initial begin
		$monitor("result=%d",result);
		$dumpfile("flopr.vcd");
		$dumpvars(0,result);
	end
endmodule

`timescale 1ns/1ps

module sim_test();
	logic Clk,reset;
	logic[1:0] s;
	logic[31:0] WriteData, DataAdr;
	logic MemWrite;

	top _top(Clk, reset, WriteData, DataAdr, MemWrite);
	always #1 Clk = ~Clk;

	initial begin
		reset = 1;
		Clk = 0;
		#20
		reset = 0;
		#500
		$finish;
	end

	initial begin
		$dumpfile("sim.vcd");
		$dumpvars(0, sim_test);
	end
endmodule

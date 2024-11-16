module flopr #(parameter WIDTH = 8)
		(input logic clk,reset,
            	input logic [WIDTH-1:0] d,
            	output logic [WIDTH-1:0] q);

    //加算器で4バイト分加算したd
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= 0;
        else q <= d;
endmodule

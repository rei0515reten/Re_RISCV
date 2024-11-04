module mux2 #(parameter WIDTH = 8)
		(input logic [WIDTH-1:0] d0, d1,
            	input logic s,
            	output logic [WIDTH-1:0] out);

    assign out = s ? d1 : d0;
endmodule

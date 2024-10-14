module mux2(input logic [31:0] d0, d1,
            input logic s,
            output logic [31:0] out);

    assign out = s ? d1 : d0;
endmodule
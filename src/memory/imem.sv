module imem(input logic [31:0]a,
            output logic [31:0]rd);

    logic [31:0] RAM[63:0];

    initial
        $readmemh("../sim/riscvtest.txt",RAM);

    //1wordずつ取り出す
    assign rd = RAM[a[31:2]];
endmodule

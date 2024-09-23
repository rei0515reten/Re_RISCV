module imem(input logic [31:0]Q,
            output logic [31:0]out);
    logic [31:0] array[4];

    initial begin
        //32bitでデータを代入(32bit長のarrayに)
        array[0] = 32'b0000;
        array[1] = 32'b0001;
        array[2] = 32'b0010;
        array[3] = 32'b0011;
    end

    //assignで常に繋げる
    assign out = array[Q];
endmodule
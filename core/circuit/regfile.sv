module regfile(input logic clk,
                input logic write_enable,
                input logic [4:0]read_reg1,read_reg2,write_reg,
                input logic [31:0]write_data,
                output logic [31:0]read_data1,read_data2);
    
    logic [31:0] rf[31:0];

    //write_enable信号が1の時に書き込みを許可する
    //write_reg(ディスティネーションrd)に書き込む
    always_ff @(posedge clk)
        if(write_enable) rf[write_reg] <= write_data;
    
    //read_reg1と2には32個のレジスタのレジスタ番号が記録されている
    //指定されたレジスタ番号のレジスタの値を出力する
    assign read_data1 = (read_reg1 != 0) ? rf[read_reg1] : 0;
    assign read_data2 = (read_reg2 != 0) ? rf[read_reg2] : 0;

endmodule


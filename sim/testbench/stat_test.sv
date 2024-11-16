`timescale 1ns/1ps

module stat_test();
    logic Clk,reset;
    logic[1:0] s;

    stat _stat(Clk,reset,s);
    always #5 Clk = ~Clk;

    initial begin
        reset = 1;
        Clk = 0;
        #20 
        reset = 0;
        #500
        $finish;
    end

    initial begin
        $monitor("state=%d",s);
        $dumpfile("state.vcd");
        $dumpvars(0, stat_test);
    end


endmodule
module counter_test();
    logic Clk,reset;
    logic [31:0] q;
    logic [31:0] Q;
    logic [31:0] out;

    counter dut1(Clk,reset,q);
    //imem dut2(Q,out);

    //クロック生成
    always #5 Clk = ~Clk;


    initial begin
       reset = 1;
       Clk = 1;
       #10
       reset = 0; 
       #500;
       $finish;
    end
    
    assign Q = q;


    initial begin
       $monitor("Clk=%d, reset=%d, q=%d, Q=%d, out=%d", Clk, reset, q, Q, out);
       $dumpfile("counter.vcd");
       $dumpvars(0, counter_test);
    end
endmodule    
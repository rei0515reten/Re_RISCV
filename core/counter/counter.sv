module counter (input logic Clk,
                input logic reset,
                output logic [31:0] q);

    //resetはフリップフロップ(q)の初期化信号
    //この場合resetが1の時に初期化としてqは0を吐き出す（ゴミデータ排除のため）
    //counter_testの記述によって、resetが立ち下がった時に初期化が終わり
    //フリップフロップ本来の機能（カウンタ）が始まる
    always_ff @( posedge Clk, posedge reset )
        if(reset) q <= 0;
        else      q <= q + 1;
endmodule
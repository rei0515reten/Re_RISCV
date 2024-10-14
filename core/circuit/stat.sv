typedef enum logic [1:0] {FETCH, DECODE, MEMORY, WRITEBACK} state_type;

module stat(input logic clk,
            input logic reset,
            output state_type out);
    state_type next_state, state;

    //組み合わせ回路
    always_comb begin
        case (state)
            FETCH: next_state = DECODE;
            DECODE: next_state = MEMORY;
            MEMORY: next_state = WRITEBACK;
            WRITEBACK: next_state = FETCH;
        endcase
    end

    //順序回路
    //always_ff @の()内はセンシティビティリストで＠はイベントを意味する
    //非同期リセット付きフリップフロップを意味する
    //センシティビティリストにresetがないフリップフロップは同期リセット付きフリップフロップ
    always_ff @(posedge clk, posedge reset)
        if(reset) state <= FETCH;
        else state <= next_state;
    
    assign out = state;

endmodule
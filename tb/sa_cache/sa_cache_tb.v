
module sa_cache_tb;

    //reset that pulses once
    reg reset = 0;
    reg clk;
    reg i_tag_in;
    reg i_index_in;
    reg i_offset_in;
    reg dataW_in;
    reg i_memory_line_in;
    reg i_memory_response_in;
    reg memRW_in;
    reg o_data_out;
    sa_cache c0 (
        .clk(clk),
        .rst(reset)
    );

    initial begin 
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        i_tag_in = 0;
        forever #10 = 
    initial begin

        $dumpfile("sa_cache_tb.vcd");
        $dumpvars(0,sa_cache_tb);

        # 10 reset = 1'b1;
        # 12 reset = 1'b0;
        # 200 $finish;
    end

endmodule

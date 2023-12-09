
module sa_cache_tb;

    //reset that pulses once
    reg reset = 0;
    reg clk;
    
    sa_cache c0 (
        .clk(clk),
        .rst(reset)
    );

    initial begin 
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin

        $dumpfile("sa_cache_tb.vcd");
        $dumpvars(0,sa_cache_tb);

        # 10 reset = 1'b1;
        # 12 reset = 1'b0;
        # 200 $finish;
    end

endmodule

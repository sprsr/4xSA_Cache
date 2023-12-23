module Comparator
#(
    parameter TAG_WIDTH = 18 
)
(
    input [TAG_WIDTH - 1: 0] i_a,
    input [TAG_WIDTH - 1: 0] i_b,
    output reg               o_y = 1'b0
);
    initial begin
        o_y <= 1'b0;
    end
    always @(*) begin
        if (i_a == i_b)
            o_y <= 1'b1;
        else 
            o_y <= 1'b0;
    end
endmodule


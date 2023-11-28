module Comparator
#(
    parameter INPUT_WIDTH = 32
)
(
    input [INPUT_WIDTH - 1: 0] i_a,
    input [INPUT_WIDTH - 1: 0] i_b,
    output                     o_y
);
assign o_y = (i_a == i_b);
endmodule


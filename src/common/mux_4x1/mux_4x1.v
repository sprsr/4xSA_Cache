module mux_4x1 
#( 
   parameter WAYS = 4,
   parameter LINE_SIZE_BYTES = 4,
   parameter LRU_BITS = 1,
   parameter VALID_BITS = 1,
   parameter DIRTY_BITS = 1,
   parameter TAG_BITS = 18
)
(
  input [(VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8))- 1 : 0]  i_data_0,
  input [(VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8))- 1 : 0]  i_data_1,
  input [(VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8))- 1 : 0]  i_data_2,
  input [(VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8))- 1 : 0]  i_data_3,
  input [WAYS - 1: 0]      i_sel,
  output [(LINE_SIZE_BYTES * 8) - 1 : 0] o_y 
);

reg [(LINE_SIZE_BYTES * 8) - 1 : 0] r_y;
assign o_y = r_y;

always @(*) begin
    case (i_sel) 
        4'b0001: r_y <= i_data_0;
        4'b0010: r_y <= i_data_1;
        4'b0100: r_y <= i_data_2;
        4'b1000: r_y <= i_data_3;
    endcase
end
endmodule

module mux_4x_1 
#( parameter LINE_SIZE_BYTES = 64)
(
  input wire  [(LINE_SIZE_BYTES*8) - 1 : 0] [3: 0] i_data ,   
  input wire  [3: 0]      i_sel,
  output wire [(LINE_SIZE_BYTES*8) - 1 : 0] o_y 
);

reg [LINE_SIZE_BYTES - 1 : 0] r_y;
assign o_y = r_y;

always @(*) begin
    case (i_sel) 
        4'b0001: r_y <= i_data[0];
        4'b0010: r_y <= i_data[1];
        4'b0100: r_y <= i_data[2];
        4'b1000: r_y <= i_data[3];
    endcase
end
endmodule

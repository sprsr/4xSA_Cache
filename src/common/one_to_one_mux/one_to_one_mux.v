// 1-to-1 Multiplexer Module

module one_to_one_mux 
#( parameter LINE_SIZE_BYTES = 64,
   parameter WAYS     = 4)
(
  input wire  [(LINE_SIZE_BYTES*8) - 1 : 0] i_data [WAYS - 1: 0],   
  input wire  [WAYS - 1: 0]      i_sel,
  output wire [(LINE_SIZE_BYTES*8) - 1 : 0] o_y 
);

reg [LINE_SIZE_BYTES - 1 : 0] r_y = 'h0;
assign o_y = r_y;

always @(*) begin
    for (int i = 0; i < WAYS; i = i+1) begin
        if (i_sel[i]) begin
            r_y = i_data[i];
        end
    end
end
endmodule

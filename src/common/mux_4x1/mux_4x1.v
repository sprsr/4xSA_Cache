// 1-to-1 Multiplexer Module

module one_to_one_mux 
#( parameter DATA_WIDTH = 32,
   parameter INPUTS     = 4)
(
  input wire  [DATA_WIDTH - 1 : 0] i_data [INPUTS - 1: 0],   
  input wire  [INPUTS - 1: 0]      i_sel,
  output wire [DATA_WIDTH - 1 : 0] o_y 
);
reg [DATA_WIDTH - 1 : 0] r_y = 'h0;

generate
    genvar i;
    for (i = 0; i < INPUTS; i = i+1) begin
        if (i_sel[i]) begin
            assign r_y = i_data[i];
        end
    end
endgenerate
endmodule

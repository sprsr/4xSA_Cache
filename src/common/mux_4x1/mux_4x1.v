// 4-to-1 Multiplexer Module

module fourToOneMux 
#( parameter DATA_WIDTH = 32)
(
  input wire [DATA_WIDTH - 1 : 0] i_a,   
  input wire [DATA_WIDTH - 1 : 0] i_b,   
  input wire [DATA_WIDTH - 1 : 0] i_c,   
  input wire [DATA_WIDTH - 1 : 0] i_d,   
  input wire                      i_sel_a,
  input wire                      i_sel_b,
  input wire                      i_sel_c,
  input wire                      i_sel_d,
  output wire [DATA_WIDTH -1 : 0] o_y 
);

  // Mux logic
  assign o_y = (i_sel_a == 1'b1) ? i_a :
            (i_sel_b == 1'b1) ? i_b :
            (i_sel_c == 1'b1) ? i_c :
                             i_d;
endmodule

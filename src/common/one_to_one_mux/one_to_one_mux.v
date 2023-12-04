// 1-to-1 Multiplexer Module

module one_to_one_mux 
#( parameter LINE_SIZE_BYTES = 64,
   parameter WAYS     = 4)
(
  input wire  [(LINE_SIZE_BYTES*8) - 1 : 0] i_data [WAYS - 1: 0],   
  input wire  [WAYS - 1: 0]      i_sel,
  output wire [(LINE_SIZE_BYTES*8) - 1 : 0] o_y 
);

reg [LINE_SIZE_BYTES - 1 : 0] r_y;
assign o_y = r_y;


//reg [$clog2(WAYS):0] selector;
/*function [$clog2(WAYS):0] this_way(input [WAYS-1:0] select);
    for (integer i = 0; i < WAYS; i = i+1) begin
        if (select[i]) begin
            this_way <= i;
            return;
        end
    end
    this_way = WAYS;
endfunction*/

always @(*) begin
    //for (integer i = 0; i < WAYS; i = i+1) begin
    //selector = this_way(i_sel);
    //if (selector < WAY)
    case (i_sel) begin
        4'h1: r_y <= i_data[0];
        h'2: r_y <= i_data[1];
        h'4: r_y <= i_data[2];
        h'8: r_y <= i_data[3];
    endcase
end
endmodule

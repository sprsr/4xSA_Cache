module memory(
#(  parameter CACHE_LINES = 256,
    parameter LINE_SIZE_BYTES   = 64,
    parameter LRU_BITS = 1,
    parameter VALID_BITS = 1,
    parameter DIRTY_BITS = 1,
    parameter TAG_BITS = 18,
    parameter DATA_WIDTH = 32,
    parameter WAYS = 4)

(
    input                                clk,
    input                                rst,
    input  [(TAG_BITS -1): 0]            i_tag,
    input  [($log2(CACHE_LINES) - 1): 0] i_index,
    output [(DATA_WIDTH -1): 0]          o_data,
    output                               o_cache_hit
);

parameter LINE_WIDTH = (VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8));

reg [((VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8))) - 1 : 0] cache [0:(CACHE_LINES - 1)] [0: WAYS - 1];
wire [WAYS - 1 : 0] hit;

generate
    genvar i;
    for (i = 0; i < WAYS) begin
        Comparator #() u_inst_comparator (
            .i_a(cache[i_index][WAY][(LINE_WIDTH - VALID_BITS - LRU_BITS - DIRTY_BITS - 1) -: TAG_BITS]),
            .i_b(i_tag),
            .o_y(hit[WAY])
        );
    end
endgenerate

always @(posedge clk or posedge rst) begin

end



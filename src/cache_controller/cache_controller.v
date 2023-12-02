// memory.v
// @sprsr
module cache_controller 
#(  parameter CACHE_LINES = 256,
    parameter LINE_SIZE_BYTES   = 64,
    parameter LRU_BITS = 1,
    parameter VALID_BITS = 1,
    parameter DIRTY_BITS = 1,
    parameter TAG_BITS = 18,
    parameter INDEX_BITS = 8,
    parameter OFFSET_BITS = 6,
    parameter DATA_WIDTH = 32,
    parameter ADDRESS_WIDTH = 32,
    parameter WAYS = 4)

    (
        input  [TAG_BITS -1 : 0]                 i_tag,
        //input  [($log2(CACHE_LINES) - 1): 0]     i_index,
        input  [(INDEX_BITS - 1): 0]     i_index,
        //input  [($log2(LINE_SIZE_BYTES) - 1): 0] i_offset,
        //input  [(OFFSET_BITS - 1): 0] i_offset,
        output [(LINE_SIZE_BITS -1): 0]              o_data,
        output                                       o_cache_hit
    );

    localparam LINE_SIZE_BITS = LINE_SIZE_BYTES * 8;
    localparam LINE_WIDTH = (VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8));

    reg [LINE_WIDTH - 1 : 0] cache [0:(CACHE_LINES - 1)] [0: WAYS - 1];
    wire [WAYS - 1 : 0] hit;
    reg [(LINE_SIZE_BYTES * 8) - 1: 0] data [WAYS - 1: 0];
    wire [WAYS - 1 : 0] mux_sel;
    assign o_cache_hit = hit;

    initial begin 
        for (integer i = 0; i < WAYS; i= i+1) begin
            data[i] = cache[i_index][i][LINE_SIZE_BITS - 1: 0];
        end
    end

    //Generate comparator for each WAY
    generate
        genvar i;

        for (i = 0; i < WAYS; i= i+1) begin
            Comparator #() u_inst_comparator (
                .i_a(cache[i_index][i][(LINE_WIDTH - VALID_BITS - LRU_BITS - DIRTY_BITS - 1) -: TAG_BITS]),
                .i_b(i_tag),
                .o_y(hit[i])
            );
            AND #() u_inst_and (
                .i_a(hit[i]),
                .i_b(cache[i_index][i][LINE_WIDTH - 1]),
                .o_y(mux_sel[i])
            );
        end
    endgenerate

    one_to_one_mux #() inst_one_to_one_mux (
        .i_data(data),
        .i_sel(mux_sel),
        .o_y(o_data)
    );

    endmodule



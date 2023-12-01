// memory.v
// @sprsr
module memory
#(  parameter CACHE_LINES = 256,
    parameter LINE_SIZE_BYTES   = 64,
    parameter LRU_BITS = 1,
    parameter VALID_BITS = 1,
    parameter DIRTY_BITS = 1,
    parameter DATA_WIDTH = 32,
    parameter ADDRESS_WIDTH = 32,
    parameter LINE_SIZE_BITS = LINE_SIZE_BYTES*8,
    parameter TAG_BITS = ADDRESS_WIDTH - (INDEX_WIDTH + OFFSET_WIDTH),
    parameter LINE_WIDTH = (VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8)),
    parameter WAYS = 4)

    (
        input                                clk,
        input                                rst,
        input  [ADDRESS_WIDTH -1 : 0]        i_address,
        input  [($log2(CACHE_LINES) - 1): 0] i_index,
        output [(DATA_WIDTH -1): 0]          o_data,
        output                               o_cache_hit
    );

    localparam OFFSET_WIDTH  = $log2(LINE_SIZE_BYTES);
    localparam INDEX_WIDTH   = $log2(CACHE_LINES);
    localparam ADDRESS_TAG = i_address[(ADDRESS_WIDTH - 1) -: TAG_BITS];
    localparam ADDRESS_INDEX = i_address[ADDRESS_WIDTH - TAG_BITS - 1 -: INDEX_WIDTH];
    localparam ADDRESS_OFFSET = i_address[ADDRESS_WIDTH - TAG_BITS - INDEX_WIDTH - 1 -: OFFSET_WIDTH];


    reg [LINE_WIDTH - 1 : 0] cache [0:(CACHE_LINES - 1)] [0: WAYS - 1];
    wire [WAYS - 1 : 0] hit;
    wire [(LINE_SIZE_BYTES * 8) - 1: 0] data [WAYS - 1: 0];
    wire [WAYS - 1 : 0] mux_sel;

    initial begin 
        for (i = 0; i < WAYS; i= i+1) begin
            data[i] = cache[ADDRESS_INDEX][i][LINE_SIZE_BITS - 1: 0];
        end
    end

    //Generate comparator for each WAY
    generate
        genvar i;

        for (i = 0; i < WAYS; i= i+1) begin
            Comparator #() u_inst_comparator (
                .i_a(cache[ADDRESS_INDEX][i][(LINE_WIDTH - VALID_BITS - LRU_BITS - DIRTY_BITS - 1) -: TAG_BITS]),
                .i_b(ADDRESS_TAG),
                .o_y(hit[i])
            );
            AND #() u_inst_and (
                .i_a(hit[i]),
                .i_b(cache[ADDRESS_INDEX][i][LINE_WIDTH - 1]),
                .o_y(mux_sel[i])
            );
        end
    endgenerate

    one_to_one_mux #() inst_one_to_one_mux (
        .i_data(data),
        .i_index(mux_sel),
        .o_y(o_data)
    );

    endmodule



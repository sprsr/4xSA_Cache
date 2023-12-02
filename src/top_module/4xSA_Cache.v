module 4xSA_Cache
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
    input         clk,
    input         rst,
    input  [31:0] i_addr,
    input  [31:0]  dataW,
    input          memRW,
    output [31:0] o_data,
    output        fetch_data_line = 0
);

wire data_line [(LINE_SIZE_BYTES*8):0];
wire hit;

cache_controller #() inst_controller (
    .i_tag(i_addr[(ADDRESS_WIDTH - 1)-:TAG_BITS]),
    .i_index(i_addr[(ADDRESS_WIDTH - TAG_BITS - 1) -: INDEX_BITS]),
    .o_data(data_line),
    .o_cache_hit(hit)
);


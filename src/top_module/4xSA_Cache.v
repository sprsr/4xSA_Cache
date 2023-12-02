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
    output [31:0] o_data
);


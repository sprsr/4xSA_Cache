module cache_controller#(
#(  parameter CACHE_LINES = 256,
    parameter LINE_SIZE_BYTES   = 64,
    parameter LRU_BITS = 1,
    parameter VALID_BITS = 1,
    parameter DIRTY_BITS = 1,
    parameter DATA_WIDTH = 32,
    parameter WAYS = 4,
    parameter OFFSET_WIDTH  = $log2(LINE_SIZE_BYTES),
    parameter INDEX_WIDTH   = $log2(CACHE_LINES),
    parameter TAG_BITS = 18,
    parameter ADDRESS_WIDTH = TAG_BITS + INDEX_WIDTH + OFFSET_WIDTH)
(
    input      clk,
    input      rst,
    input      [ADDRESS_WIDTH - 1 : 0] i_address,
    input      [INDEX_WIDTH - 1: 0]    i_index,
    output [(DATA_WIDTH -1): 0]          o_data,
    output                               o_cache_hit
);
    

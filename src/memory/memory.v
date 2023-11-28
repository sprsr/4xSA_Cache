module memory(
#(  parameter CACHE_LINES = 256,
    parameter LINE_SIZE_BYTES   = 64,
    parameter LRU_BITS = 1,
    parameter VALID_BITS = 1,
    parameter DIRTY_BITS = 1,
    parameter TAG_BITS = 18,
    parameter DATA_WIDTH = 32)
(
    input  [(TAG_BITS -1): 0]            tag,
    input  [($log2(CACHE_LINES) - 1): 0] index,
    output [(DATA_WIDTH -1): 0]          data,
    output                               cache_hit
);


reg cache [((VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8)) * CACHE_LINES) - 1 : 0];



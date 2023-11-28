module memory(
#(  parameter CACHE_LINES = 256,
    parameter LINE_SIZE_BYTES   = 64,
    parameter LRU_BITS = 1,
    parameter VALID_BITS = 1,
    parameter DIRTY_BITS = 1,
    parameter TAG_BITS = 18)
    input tag,
    input index,
)

parameter CACHE_LINES = 256,
          LINE_SIZE_BYTES   = 64,
          LRU_BITS = 1,
          VALID_BITS = 1,
          DIRTY_BITS = 1,
          TAG_BITS = 18;

reg cache [((VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8)) * CACHE_LINES) - 1 : 0];



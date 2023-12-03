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

wire [(LINE_SIZE_BYTES*8):0] data_line ;
wire [WAYS-1:0] hit;

cache_controller #() inst_controller (
    .i_tag(i_addr[(ADDRESS_WIDTH - 1)-:TAG_BITS]),
    .i_index(i_addr[(ADDRESS_WIDTH - TAG_BITS - 1) -: INDEX_BITS]),
    .o_data(data_line),
    .o_cache_hit(hit)
);

    always @(posedge clk or posedge rst) begin
        if (memRW) begin
        
        end else begin
            if (hit != 0) begin
                way_index = find_hit(hit);
                // read the cache
                o_data <= cache[i_index][way_index][(8*i_offset) +: DATA_WIDTH];
                // set the LRU bit
                cache[i_index][way_index][LINE_WIDTH - 3] <= 1'b1;
            end
    endmodule

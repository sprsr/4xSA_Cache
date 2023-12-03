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
        input                                       clk,
        input                                       rst,
        input  [ADDRESS_WIDTH - 1:0]                i_addr,
        input  [DATA_WIDTH - 1:0]                   dataW,
        input                                       memRW,
        output [DATA_WIDTH - 1:0]                   o_data,
        input  [TAG_BITS -1 : 0]                    i_tag,
        input  [(INDEX_BITS - 1): 0]                i_index,
        input  [(OFFSET_BITS - 1): 0]               i_offset,
        output reg [(LINE_SIZE_BITS -1): 0]         o_data,
        output reg                                  cache_miss,
        //input  [($log2(CACHE_LINES) - 1): 0]     i_index,
        //input  [($log2(LINE_SIZE_BYTES) - 1): 0] i_offset,
    );

    localparam LINE_SIZE_BITS = LINE_SIZE_BYTES * 8;
    localparam LINE_WIDTH = (VALID_BITS + LRU_BITS + DIRTY_BITS + TAG_BITS + (LINE_SIZE_BYTES * 8));

    reg [LINE_WIDTH - 1 : 0] cache [0:(CACHE_LINES - 1)] [0: WAYS - 1];
    wire [WAYS - 1 : 0] hit;
    reg [(LINE_SIZE_BYTES * 8) - 1: 0] data [WAYS - 1: 0];
    wire [WAYS - 1 : 0] mux_sel;
    reg [$clog2(WAYS)-1:0] way_index;

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
    function find_hit(input [WAYS-1:0] hit);
        find_hit = 0;
        for (integer i = 0; i< WAYS; i=i+1) begin
            if (hit[i] == 1'b1) begin
                find_hit = i;
            end
        end
    endfunction

    always @(posedge clk or posedge rst) begin
        
        if (rst) begin
            o_data <= 32'b0;
            cache_miss <= 0;
        end else begin
            if (!cache_miss)
            if (hit != 0) begin
                way_index = find_hit(hit);
                // read the cache
                case (memRW) 
                    1'b1: begin
                        // Write to Cache
                        cache[i_index][way_index][(8*i_offset) +: DATA_WIDTH] <= dataW;
                        // Set Cache Line As Dirty
                        cache[i_index][way_index][LINE_WIDTH - 2] <= 1'b1;
                        //Maybe Placeholder
                        o_data <= dataW;
                    end
                    1'b0: begin
                        //Read Cache
                        o_data <= cache[i_index][way_index][(8*i_offset) +: DATA_WIDTH];
                    end
                endcase
                // set the LRU bit
                cache[i_index][way_index][LINE_WIDTH - 3] <= 1'b1;
            end else begin
                cache_miss <= 1'b1; 

    endmodule



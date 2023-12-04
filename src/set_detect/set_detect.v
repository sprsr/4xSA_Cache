module set_detect
#( parameter WAYS = 4 )
(
    input [WAYS-1:0] hit,
    output reg set
);

always @(*) begin
        set = 0;
        for (integer i = 0; i< WAYS; i=i+1) begin
            if (hit[i] == 1'b1) begin
                set = i;
            end
        end
end
endmodule

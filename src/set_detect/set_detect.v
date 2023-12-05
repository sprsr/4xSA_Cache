module set_detect
#( parameter WAYS = 4 )
(
    input [WAYS-1:0] hit,
    output set
);
reg r_set;
assign set = r_set;

always @(*) begin
        for (integer i = 0; i< WAYS; i=i+1) begin
            if (hit[i] == 1'b1) begin
                r_set = i;
            end
        end
end
endmodule

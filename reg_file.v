module reg_file (a1,a2,a3,wd3,we3,clk,rd1,rd2);
    
    input we3;
    input clk;
    input [4:0] a1,a2,a3;
    input [31:0] wd3;
    output [31:0] rd1,rd2;

    reg [31:0] mem [0:31];

    assign rd1 = mem[a1];
    assign rd2 = mem[a2];

    always @(posedge clk) begin
        if (we3) begin
            mem[a3] <= wd3;
        end
        
    end

endmodule
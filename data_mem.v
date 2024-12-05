module data_mem (word_address,wd,we,clk,rd);

    parameter MEM_DEPTH = 4096; //16kb
    localparam ADDR_WIDTH  = $clog2(MEM_DEPTH);//12 bits

    input clk,we;
    input [31:0] wd;
    input [ADDR_WIDTH-1:0] word_address; // 12 bita
    output [31:0] rd;

    reg [31:0] mem [0:MEM_DEPTH-1];

    assign rd = mem[word_address];
    
    always @(posedge clk) begin
        if (we) begin
            mem[word_address] <= wd;
        end
    end

endmodule
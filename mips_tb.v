module mips_tb();

reg clk,rst;

initial begin
    clk=0;
    forever begin
        #1 clk=~clk;
    end
end


mips p1 (clk,rst);

initial begin
    $readmemh("mem.txt",p1.mem1.mem);
    $readmemh("mem_reg.txt",p1.reg_file1.mem);
    rst=1;
    @(negedge clk);
    rst=0;
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    @(negedge clk);
    $stop;
end

endmodule
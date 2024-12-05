module instruction_mem (address,instr);

parameter MEM_DEPTH = 1024; // word addressing
localparam addr = $clog2(MEM_DEPTH);

input [addr-1:0]address; //[9:0]
output [31:0] instr;

reg [31:0] mem [0:MEM_DEPTH-1];

assign instr = mem[address];
    
endmodule
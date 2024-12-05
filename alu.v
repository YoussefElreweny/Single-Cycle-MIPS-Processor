module alu (srca,srcb,alucontrol,zero,result);
   
    input [31:0] srca,srcb;
    input [2:0] alucontrol;
    output reg [31:0] result;
    output zero;
    
    assign zero = (result == 32'b0);

    always @(*) begin
        case (alucontrol)
            3'b000: result = srca & srcb;         // AND
            3'b001: result = srca | srcb;         // OR
            3'b010: result = srca + srcb;         // ADD
            3'b110: result = srca - srcb;         // SUBTRACT
            3'b111: result = (srca < srcb) ? 32'b1 : 32'b0; //slt
            3'b100: result = ~(srca | srcb);      // NOR
            default: result = 32'b0;               // Default to 0
        endcase
    end

endmodule
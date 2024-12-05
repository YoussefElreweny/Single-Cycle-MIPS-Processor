module mips (clk,rst);
    input clk,rst;

    //// Declaration ////


    //Program Counter
    reg [31:0] pc;
    wire [31:0] pc_next_0,pc_next,pcplus4,pcbranch;
    wire pcsrce;


    //Instruction Mem
    wire [31:0] instr;

    //Reg file
    wire [4:0] WriteReg;
    wire [31:0] Result,rd1,rd2;
    
    //Control Unit
    wire MemtoReg;
    wire MemWrite;
    wire Branch;
    wire ALUSrc;
    wire RegDst;
    wire RegWrite;
    wire jump;
    wire [6:0] control_out;
    wire [2:0] alu_control;

    //ALU
    wire zero;
    wire [31:0] srcb;
    wire [31:0] alu_result;

    //Data Mem
    wire [31:0] read_data;

    //signextend
    wire [31:0] signImm;



    //// LOGIC & Insantiation///

    assign pc_next_0 = (pcsrce) ? pcbranch : pcplus4;
    assign pc_next = (jump) ? {pc[31:28], {instr[25:0],2'b00}} : pc_next_0;
    assign pcsrce = Branch & zero;
    assign pcplus4 = pc + 4;
    assign pcbranch = pcplus4 + (signImm<<2);

    always @(posedge clk,posedge rst) begin
        if (rst) begin
            pc<=0;
        end
        else
            pc<=pc_next;
    end
    
    //Instruction Mem
    instruction_mem mem1 (pc[11:2],instr);


    //Reg file
    assign WriteReg = (RegDst) ? instr[15:11] : instr[20:16];

    reg_file reg_file1 (instr[25:21],instr[20:16],WriteReg,Result,RegWrite,clk,rd1,rd2); 


    //Control Unit
    assign jump = control_out[0];
    assign MemtoReg = control_out[1];
    assign MemWrite = control_out[2];
    assign Branch = control_out[3];
    assign ALUSrc = control_out[4];
    assign RegDst = control_out[5];
    assign RegWrite = control_out[6];
    
    control c1(instr[31:26],instr[5:0],control_out,alu_control);


    //ALU
    assign srcb = (ALUSrc) ? signImm : rd2;

    alu a1 (rd1,srcb,alu_control,zero,alu_result);


    //Data Mem
    assign Result = (MemtoReg) ? read_data : alu_result;

    data_mem d1 (alu_result[11:0],rd2,MemWrite,clk,read_data);

    //signextend
    sign_extend s1 (instr[15:0],signImm);

endmodule
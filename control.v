module control (
    input [5:0] opcode,          // Opcode field
    input [5:0] funct,           // Function code (for R-type)
    output reg [6:0] control_out, // Main control signals
    output reg [2:0] alu_control  // ALU operation control signals
);

    always @(*) begin

        case (opcode)
            6'b000000: begin // R-type
                control_out = 7'b1100000; // Set R-type control signals
                case (funct) // Decode funct field for ALU control
                    6'b100000: alu_control = 3'b010; // add
                    6'b100010: alu_control = 3'b110; // sub
                    6'b100100: alu_control = 3'b000; // and
                    6'b100101: alu_control = 3'b001; // or
                    6'b101010: alu_control = 3'b111; // slt
                    default:   alu_control = 3'b011; // Invalid/unknown
                endcase
            end
            6'b100011: begin // lw
                control_out = 7'b1010010;
                alu_control = 3'b010; // ALU performs add for address calculation
            end
            6'b101011: begin // sw
                control_out = 7'b0010100;
                alu_control = 3'b010; // ALU performs add for address calculation
            end
            6'b000100: begin // beq
                control_out = 7'b0001000;
                alu_control = 3'b110; // ALU performs subtract for comparison
            end
            6'b001000: begin // addi
                control_out = 7'b1010000;
                alu_control = 3'b010; // ALU performs add
            end
            6'b000010: begin // j (jump)
                control_out = 7'b0000001; // Special signal for jump (assumes control logic handles this correctly)
                alu_control = 3'b000;    // ALU is not used in jump
            end
            default: begin // Unknown opcode
                control_out = 7'b0000000; // Set all control signals to safe values (no writes, no branch)
                alu_control = 3'b011;    // Default ALU behavior
            end
        endcase
    end

endmodule

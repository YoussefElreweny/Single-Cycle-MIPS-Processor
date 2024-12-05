vlib work
#vlog Project1.v DSP_tb.v
vsim -voptargs=+acc work.mips_tb
add wave -position insertpoint  \
sim:/mips_tb/p1/clk \
sim:/mips_tb/p1/rst \
sim:/mips_tb/p1/mem1/mem
add wave -position insertpoint  \
sim:/mips_tb/p1/reg_file1/mem
add wave -position insertpoint  \
sim:/mips_tb/p1/d1/mem
add wave -position insertpoint  \
sim:/mips_tb/p1/d1/wd \
sim:/mips_tb/p1/d1/rd \
sim:/mips_tb/p1/d1/word_address \
sim:/mips_tb/p1/pc \
sim:/mips_tb/p1/pc_next_0 \
sim:/mips_tb/p1/pc_next \
sim:/mips_tb/p1/pcplus4 \
sim:/mips_tb/p1/pcbranch \
sim:/mips_tb/p1/pcsrce \
sim:/mips_tb/p1/instr \
sim:/mips_tb/p1/WriteReg \
sim:/mips_tb/p1/Result \
sim:/mips_tb/p1/rd1 \
sim:/mips_tb/p1/rd2 \
sim:/mips_tb/p1/MemtoReg \
sim:/mips_tb/p1/MemWrite \
sim:/mips_tb/p1/Branch \
sim:/mips_tb/p1/ALUSrc \
sim:/mips_tb/p1/RegDst \
sim:/mips_tb/p1/RegWrite \
sim:/mips_tb/p1/jump \
sim:/mips_tb/p1/control_out \
sim:/mips_tb/p1/alu_control \
sim:/mips_tb/p1/zero \
sim:/mips_tb/p1/srcb \
sim:/mips_tb/p1/alu_result \
sim:/mips_tb/p1/read_data \
sim:/mips_tb/p1/signImm
run -all
#quit -sim
onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/dut/clk
add wave -noupdate /CPU_testbench/dut/reset
add wave -noupdate -expand -group PC -radix decimal /CPU_testbench/dut/grabAddr/out
add wave -noupdate -expand -group PC -radix decimal /CPU_testbench/dut/grabAddr/in
add wave -noupdate -expand -group PC -radix decimal /CPU_testbench/dut/grabAddr/PC4
add wave -noupdate -radix decimal /CPU_testbench/dut/PCaddr
add wave -noupdate /CPU_testbench/dut/instruction
add wave -noupdate -expand -group Control /CPU_testbench/dut/PCsr
add wave -noupdate -expand -group Control -radix unsigned /CPU_testbench/dut/signals/instruct
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/RegWrite
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/Reg2Loc
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/Branch
add wave -noupdate -expand -group Control /CPU_testbench/dut/Blt
add wave -noupdate -expand -group Control -radix decimal /CPU_testbench/dut/exflush
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/MemWrite
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/MemtoReg
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/MemRead
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/UncondB
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/B
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/ALUOp
add wave -noupdate -expand -group Control /CPU_testbench/dut/signals/ALUSrc
add wave -noupdate -expand -group controlMUX /CPU_testbench/dut/stall0/WB
add wave -noupdate -expand -group controlMUX /CPU_testbench/dut/stall0/M
add wave -noupdate -expand -group controlMUX /CPU_testbench/dut/stall0/EX
add wave -noupdate -expand -group controlMUX /CPU_testbench/dut/stall0/sel
add wave -noupdate -expand -group ALUcontrol -radix binary /CPU_testbench/dut/signal/out
add wave -noupdate -expand -group ALUcontrol -radix unsigned /CPU_testbench/dut/signal/instruct
add wave -noupdate -expand -group ALUcontrol /CPU_testbench/dut/signal/Op
add wave -noupdate /CPU_testbench/dut/negative
add wave -noupdate /CPU_testbench/dut/zero
add wave -noupdate /CPU_testbench/dut/overflow
add wave -noupdate /CPU_testbench/dut/carry_out
add wave -noupdate -expand -group IF/ID /CPU_testbench/dut/IFnID/instruct
add wave -noupdate -expand -group IF/ID -radix decimal /CPU_testbench/dut/IFnID/PC
add wave -noupdate -expand -group IF/ID -radix decimal /CPU_testbench/dut/IFnID/pc
add wave -noupdate -expand -group IF/ID /CPU_testbench/dut/IFnID/flush
add wave -noupdate -expand -group IF/ID /CPU_testbench/dut/IFnID/write
add wave -noupdate /CPU_testbench/dut/Read2
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadData1
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadData2
add wave -noupdate /CPU_testbench/dut/reading/RegWrite
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/WriteData
add wave -noupdate -radix unsigned /CPU_testbench/dut/reading/ReadRegister1
add wave -noupdate -radix unsigned /CPU_testbench/dut/reading/ReadRegister2
add wave -noupdate -childformat {{{/CPU_testbench/dut/reading/outwr[31]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[30]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[29]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[28]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[27]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[26]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[25]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[24]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[23]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[22]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[21]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[20]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[19]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[18]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[17]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[16]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[15]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[14]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[13]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[12]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[11]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[10]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[9]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[8]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[7]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[6]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[5]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[4]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[3]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[2]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[1]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/reading/outwr[31]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[30]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[29]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[28]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[27]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[26]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[25]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[24]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[23]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[22]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[21]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[20]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[15]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[14]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[13]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[12]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[11]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[10]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[6]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/reading/outwr
add wave -noupdate -expand -group ID/EX -radix decimal /CPU_testbench/dut/IDnEX/Ao
add wave -noupdate -expand -group ID/EX -radix decimal /CPU_testbench/dut/IDnEX/Bo
add wave -noupdate -expand -group ID/EX -radix decimal /CPU_testbench/dut/IDnEX/addIO
add wave -noupdate -expand -group ID/EX -radix unsigned /CPU_testbench/dut/IDnEX/Rdout
add wave -noupdate -expand -group ID/EX -radix unsigned /CPU_testbench/dut/IDnEX/Rno
add wave -noupdate -expand -group ID/EX -radix unsigned /CPU_testbench/dut/IDnEX/Rmo
add wave -noupdate -expand -group ID/EX /CPU_testbench/dut/IDnEX/wb
add wave -noupdate -expand -group ID/EX /CPU_testbench/dut/IDnEX/m
add wave -noupdate -expand -group ID/EX -radix decimal /CPU_testbench/dut/IDnEX/ADDI
add wave -noupdate -expand -group ID/EX /CPU_testbench/dut/IDnEX/ALUOp
add wave -noupdate -expand -group ID/EX /CPU_testbench/dut/IDnEX/ALUSrc
add wave -noupdate -expand -group ID/EX /CPU_testbench/dut/IDnEX/Opout
add wave -noupdate -expand -group ID/EX /CPU_testbench/dut/IDnEX/Reg2Loc
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/forA
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/forB
add wave -noupdate -expand -group Forwarding -radix unsigned /CPU_testbench/dut/forward/Rn
add wave -noupdate -expand -group Forwarding -radix unsigned /CPU_testbench/dut/forward/Rm
add wave -noupdate -expand -group Forwarding -radix unsigned /CPU_testbench/dut/forward/EXmemrd
add wave -noupdate -expand -group Forwarding -radix unsigned /CPU_testbench/dut/forward/MEMwbrd
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/memWB
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/exWB
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/checkA
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/checkB
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/en0
add wave -noupdate -expand -group Forwarding /CPU_testbench/dut/forward/en1
add wave -noupdate -expand -group FORA -radix decimal /CPU_testbench/dut/consider0/out
add wave -noupdate -expand -group FORA -radix decimal /CPU_testbench/dut/consider0/data
add wave -noupdate -expand -group FORA -radix decimal /CPU_testbench/dut/consider0/result
add wave -noupdate -expand -group FORA -radix decimal /CPU_testbench/dut/consider0/regData
add wave -noupdate -expand -group FORA /CPU_testbench/dut/consider0/sel
add wave -noupdate -expand -group FORB -radix decimal /CPU_testbench/dut/consider1/out
add wave -noupdate -expand -group FORB -radix decimal /CPU_testbench/dut/consider1/data
add wave -noupdate -expand -group FORB -radix decimal /CPU_testbench/dut/consider1/result
add wave -noupdate -expand -group FORB -radix decimal /CPU_testbench/dut/consider1/regData
add wave -noupdate -expand -group FORB /CPU_testbench/dut/consider1/sel
add wave -noupdate /CPU_testbench/dut/alusrc0
add wave -noupdate -radix decimal /CPU_testbench/dut/alusrc
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/A
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/B
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/result
add wave -noupdate /CPU_testbench/dut/magic/cntrl
add wave -noupdate /CPU_testbench/dut/magic/shift
add wave -noupdate /CPU_testbench/dut/magic/negative
add wave -noupdate /CPU_testbench/dut/magic/zero
add wave -noupdate /CPU_testbench/dut/magic/overflow
add wave -noupdate /CPU_testbench/dut/magic/carry_out
add wave -noupdate -expand -group EX/MEM -radix decimal /CPU_testbench/dut/ExnMem/resultOut
add wave -noupdate -expand -group EX/MEM -radix decimal /CPU_testbench/dut/ExnMem/Bo
add wave -noupdate -expand -group EX/MEM -radix decimal /CPU_testbench/dut/ExnMem/Rdout
add wave -noupdate -expand -group EX/MEM /CPU_testbench/dut/ExnMem/zout
add wave -noupdate -expand -group EX/MEM /CPU_testbench/dut/ExnMem/MemWrite
add wave -noupdate -expand -group EX/MEM /CPU_testbench/dut/ExnMem/MemRead
add wave -noupdate -expand -group EX/MEM /CPU_testbench/dut/ExnMem/branch
add wave -noupdate -expand -group EX/MEM /CPU_testbench/dut/ExnMem/wb
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[80]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[72]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[64]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[56]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[48]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[40]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[32]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[24]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[16]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[8]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[0]}
add wave -noupdate -expand -group MEM/WB -radix decimal /CPU_testbench/dut/MEMnWB/dataO
add wave -noupdate -expand -group MEM/WB -radix decimal /CPU_testbench/dut/MEMnWB/addrO
add wave -noupdate -expand -group MEM/WB -radix decimal /CPU_testbench/dut/MEMnWB/Rdout
add wave -noupdate -expand -group MEM/WB /CPU_testbench/dut/MEMnWB/RegWrite
add wave -noupdate -expand -group MEM/WB /CPU_testbench/dut/MEMnWB/MemtoReg
add wave -noupdate -radix decimal /CPU_testbench/dut/WriteData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6996649841 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 116
configure wave -valuecolwidth 52
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {6266502508 ps} {7931306033 ps}

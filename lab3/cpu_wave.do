onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/dut/clk
add wave -noupdate /CPU_testbench/dut/reset
add wave -noupdate -radix unsigned /CPU_testbench/dut/addr
add wave -noupdate -radix decimal /CPU_testbench/dut/PCaddr
add wave -noupdate /CPU_testbench/dut/instruction
add wave -noupdate /CPU_testbench/dut/RegWrite
add wave -noupdate /CPU_testbench/dut/Reg2Loc
add wave -noupdate /CPU_testbench/dut/Branch
add wave -noupdate /CPU_testbench/dut/B
add wave -noupdate /CPU_testbench/dut/Blt
add wave -noupdate /CPU_testbench/dut/negwire
add wave -noupdate /CPU_testbench/dut/PCsr
add wave -noupdate /CPU_testbench/dut/MemWrite
add wave -noupdate /CPU_testbench/dut/MemtoReg
add wave -noupdate /CPU_testbench/dut/ALUSrc
add wave -noupdate /CPU_testbench/dut/MemRead
add wave -noupdate /CPU_testbench/dut/UncondB
add wave -noupdate /CPU_testbench/dut/negative
add wave -noupdate /CPU_testbench/dut/zero
add wave -noupdate /CPU_testbench/dut/overflow
add wave -noupdate /CPU_testbench/dut/carry_out
add wave -noupdate /CPU_testbench/dut/Read2
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadData1
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadData2
add wave -noupdate -radix decimal /CPU_testbench/dut/alusrc
add wave -noupdate /CPU_testbench/dut/reading/WriteData
add wave -noupdate -radix unsigned /CPU_testbench/dut/reading/ReadRegister1
add wave -noupdate -radix unsigned /CPU_testbench/dut/reading/ReadRegister2
add wave -noupdate -childformat {{{/CPU_testbench/dut/reading/outwr[31]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[30]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[29]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[28]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[27]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[26]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[25]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[24]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[23]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[22]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[21]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[20]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[19]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[18]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[17]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[16]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[15]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[14]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[13]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[12]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[11]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[10]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[9]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[8]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[7]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[6]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[5]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[4]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[3]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[2]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[1]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/reading/outwr[31]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[30]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[29]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[28]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[27]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[26]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[25]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[24]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[23]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[22]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[21]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[20]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[19]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[18]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[17]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[16]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[15]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[14]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[13]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[12]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[11]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[10]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[9]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[8]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[6]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/reading/outwr
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/A
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/B
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/result
add wave -noupdate /CPU_testbench/dut/magic/cntrl
add wave -noupdate /CPU_testbench/dut/magic/shift
add wave -noupdate /CPU_testbench/dut/magic/negative
add wave -noupdate /CPU_testbench/dut/magic/zero
add wave -noupdate /CPU_testbench/dut/magic/overflow
add wave -noupdate /CPU_testbench/dut/magic/carry_out
add wave -noupdate -expand -group Memory {/CPU_testbench/dut/data/mem[80]}
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6312219604 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 118
configure wave -valuecolwidth 40
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
WaveRestoreZoom {5717267799 ps} {6902747975 ps}

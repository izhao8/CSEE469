onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /CPU_testbench/dut/clk
add wave -noupdate /CPU_testbench/dut/reset
add wave -noupdate -radix decimal /CPU_testbench/dut/Extend
add wave -noupdate -radix unsigned /CPU_testbench/dut/addr
add wave -noupdate /CPU_testbench/dut/PCaddr
add wave -noupdate /CPU_testbench/dut/instruction
add wave -noupdate /CPU_testbench/dut/RegWrite
add wave -noupdate /CPU_testbench/dut/Reg2Loc
add wave -noupdate /CPU_testbench/dut/Branch
add wave -noupdate /CPU_testbench/dut/MemWrite
add wave -noupdate /CPU_testbench/dut/MemtoReg
add wave -noupdate /CPU_testbench/dut/ALUSrc
add wave -noupdate /CPU_testbench/dut/MemRead
add wave -noupdate /CPU_testbench/dut/UncondB
add wave -noupdate /CPU_testbench/dut/PCsr
add wave -noupdate /CPU_testbench/dut/negative
add wave -noupdate /CPU_testbench/dut/zero
add wave -noupdate /CPU_testbench/dut/overflow
add wave -noupdate /CPU_testbench/dut/carry_out
add wave -noupdate /CPU_testbench/dut/Read2
add wave -noupdate /CPU_testbench/dut/reading/ReadData1
add wave -noupdate /CPU_testbench/dut/reading/ReadData2
add wave -noupdate /CPU_testbench/dut/reading/WriteData
add wave -noupdate -radix unsigned /CPU_testbench/dut/reading/ReadRegister1
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadRegister2
add wave -noupdate -childformat {{{/CPU_testbench/dut/reading/outwr[8]} -radix unsigned} {{/CPU_testbench/dut/reading/outwr[7]} -radix unsigned} {{/CPU_testbench/dut/reading/outwr[6]} -radix unsigned} {{/CPU_testbench/dut/reading/outwr[5]} -radix unsigned} {{/CPU_testbench/dut/reading/outwr[4]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[3]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[2]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[1]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/reading/outwr[8]} {-height 15 -radix unsigned} {/CPU_testbench/dut/reading/outwr[7]} {-height 15 -radix unsigned} {/CPU_testbench/dut/reading/outwr[6]} {-height 15 -radix unsigned} {/CPU_testbench/dut/reading/outwr[5]} {-height 15 -radix unsigned} {/CPU_testbench/dut/reading/outwr[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/reading/outwr
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/A
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/B
add wave -noupdate /CPU_testbench/dut/magic/cntrl
add wave -noupdate /CPU_testbench/dut/magic/shift
add wave -noupdate /CPU_testbench/dut/magic/negative
add wave -noupdate /CPU_testbench/dut/magic/zero
add wave -noupdate /CPU_testbench/dut/magic/overflow
add wave -noupdate /CPU_testbench/dut/magic/carry_out
add wave -noupdate -radix unsigned /CPU_testbench/dut/magic/result
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {48738567 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 211
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
WaveRestoreZoom {0 ps} {1332187500 ps}

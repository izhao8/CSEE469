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
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadData1
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadData2
add wave -noupdate -radix decimal /CPU_testbench/dut/alusrc
add wave -noupdate /CPU_testbench/dut/reading/WriteData
add wave -noupdate -radix unsigned /CPU_testbench/dut/reading/ReadRegister1
add wave -noupdate -radix decimal /CPU_testbench/dut/reading/ReadRegister2
add wave -noupdate -childformat {{{/CPU_testbench/dut/reading/outwr[8]} -radix unsigned} {{/CPU_testbench/dut/reading/outwr[7]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[6]} -radix unsigned} {{/CPU_testbench/dut/reading/outwr[5]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[4]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[3]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[2]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[1]} -radix decimal} {{/CPU_testbench/dut/reading/outwr[0]} -radix decimal}} -expand -subitemconfig {{/CPU_testbench/dut/reading/outwr[8]} {-height 15 -radix unsigned} {/CPU_testbench/dut/reading/outwr[7]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[6]} {-height 15 -radix unsigned} {/CPU_testbench/dut/reading/outwr[5]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[4]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[3]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[2]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[1]} {-height 15 -radix decimal} {/CPU_testbench/dut/reading/outwr[0]} {-height 15 -radix decimal}} /CPU_testbench/dut/reading/outwr
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/A
add wave -noupdate -radix decimal /CPU_testbench/dut/magic/B
add wave -noupdate /CPU_testbench/dut/magic/cntrl
add wave -noupdate /CPU_testbench/dut/magic/shift
add wave -noupdate /CPU_testbench/dut/magic/negative
add wave -noupdate /CPU_testbench/dut/magic/zero
add wave -noupdate /CPU_testbench/dut/magic/overflow
add wave -noupdate /CPU_testbench/dut/magic/carry_out
add wave -noupdate -radix unsigned /CPU_testbench/dut/magic/result
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[80]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[79]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[78]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[77]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[76]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[75]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[74]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[73]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[72]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[71]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[70]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[69]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[68]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[67]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[66]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[65]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[64]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[63]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[62]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[61]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[60]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[59]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[58]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[57]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[56]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[55]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[54]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[53]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[52]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[51]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[50]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[49]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[48]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[47]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[46]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[45]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[44]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[43]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[42]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[41]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[40]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[39]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[38]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[37]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[36]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[35]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[34]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[33]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[32]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[31]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[30]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[29]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[28]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[27]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[26]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[25]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[24]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[23]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[22]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[21]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[20]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[19]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[18]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[17]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[16]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[15]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[14]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[13]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[12]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[11]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[10]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[9]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[8]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[7]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[6]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[5]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[4]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[3]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[2]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[1]}
add wave -noupdate -expand -group Memory -radix decimal {/CPU_testbench/dut/data/mem[0]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {575220200 ps} 0}
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

set projDir "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/vivado"
set projName "Gamecomment"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/au_top_0.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/reset_conditioner_1.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/button_conditioner_2.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/edge_detector_3.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/game_4.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/pipeline_5.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/regfile_6.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/ctrl_7.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/alu_16_8.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/edge_detector_9.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/counter_10.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/pn_gen_11.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/alu_adder_12.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/alu_boolean_13.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/alu_shifter_14.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/alu_compare_15.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/mx16x16_16.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/half_adder_17.v" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/verilog/full_adder_18.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/constraint/alchitry.xdc" "C:/Users/hhzhe/Documents/alchitry/Gamecomment/EvilLightsGame/work/constraint/io.xdc" "C:/Program\ Files/Alchitry/Alchitry\ Labs/library/components/au.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

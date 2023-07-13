SetActiveLib -work
comp -include "$dsn\src\Project_group6.vhd" 
comp -include "$dsn\src\TestBench\edgedetector_TB.vhd" 
asim +access +r TESTBENCH_FOR_edgedetector 
wave 
wave -noreg clk
wave -noreg reset
wave -noreg level
wave -noreg Moore_tick
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\edgedetector_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_edgedetector 

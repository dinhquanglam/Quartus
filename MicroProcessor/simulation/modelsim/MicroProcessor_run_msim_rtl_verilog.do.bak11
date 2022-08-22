transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/MicroProcessor.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/ALU.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/RegFile.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/ProgramCounter.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/InstructionMemory.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/DataMemory.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/ControlUnit.v}
vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/ALUcontrolUnit.v}

vlog -vlog01compat -work work +incdir+F:/intelFPGA_lite/18.1/MicroProcessor {F:/intelFPGA_lite/18.1/MicroProcessor/MicroProcessor_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  MicroProcessor_tb

add wave *
view structure
view signals
run -all

transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/quartus/trafficlight {C:/Users/Admin/Documents/quartus/trafficlight/trafficlight.v}

vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/quartus/trafficlight {C:/Users/Admin/Documents/quartus/trafficlight/trafficlight_tb.v}
vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/quartus/trafficlight {C:/Users/Admin/Documents/quartus/trafficlight/trafficlight.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  trafficlight_tb

add wave *
view structure
view signals
run -all

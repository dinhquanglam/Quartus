transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/quartus/den_gt {C:/Users/Admin/Documents/quartus/den_gt/den_gt.v}

vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/quartus/den_gt {C:/Users/Admin/Documents/quartus/den_gt/den_gt.v}
vlog -vlog01compat -work work +incdir+C:/Users/Admin/Documents/quartus/den_gt {C:/Users/Admin/Documents/quartus/den_gt/den_gt_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  den_gt_tb

add wave *
view structure
view signals
run -all

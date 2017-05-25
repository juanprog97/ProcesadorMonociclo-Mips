onerror {quit -f}
vlib work
vlog -work work procesadorMono.vo
vlog -work work procesadorMono.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.programCounter_vlg_vec_tst
vcd file -direction procesadorMono.msim.vcd
vcd add -internal programCounter_vlg_vec_tst/*
vcd add -internal programCounter_vlg_vec_tst/i1/*
add wave /*
run -all

vlib work
vlib msim

vlib msim/xil_defaultlib

vmap xil_defaultlib msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"../../../../project_1.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../../project_1.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.v" \


vlog -work xil_defaultlib "glbl.v"


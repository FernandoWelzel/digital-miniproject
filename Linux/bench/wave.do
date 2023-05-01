onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Requests Input}
add wave -noupdate -expand /network_tb/req_in
add wave -noupdate -divider {Request Hidden}
add wave -noupdate -expand /network_tb/network_full/full_network/layer_input/req_out
add wave -noupdate -divider {Requests output}
add wave -noupdate -expand /network_tb/req_out
add wave -noupdate -divider {Request Counter}
add wave -noupdate -radix decimal -childformat {{{/network_tb/counter[1]} -radix decimal -childformat {{{[7]} -radix decimal} {{[6]} -radix decimal} {{[5]} -radix decimal} {{[4]} -radix decimal} {{[3]} -radix decimal} {{[2]} -radix decimal} {{[1]} -radix decimal} {{[0]} -radix decimal}}} {{/network_tb/counter[0]} -radix decimal}} -expand -subitemconfig {{/network_tb/counter[1]} {-height 15 -radix decimal -childformat {{{[7]} -radix decimal} {{[6]} -radix decimal} {{[5]} -radix decimal} {{[4]} -radix decimal} {{[3]} -radix decimal} {{[2]} -radix decimal} {{[1]} -radix decimal} {{[0]} -radix decimal}}} {/network_tb/counter[1][7]} {-radix decimal} {/network_tb/counter[1][6]} {-radix decimal} {/network_tb/counter[1][5]} {-radix decimal} {/network_tb/counter[1][4]} {-radix decimal} {/network_tb/counter[1][3]} {-radix decimal} {/network_tb/counter[1][2]} {-radix decimal} {/network_tb/counter[1][1]} {-radix decimal} {/network_tb/counter[1][0]} {-radix decimal} {/network_tb/counter[0]} {-height 15 -radix decimal}} /network_tb/counter
add wave -noupdate -divider {Control signals}
add wave -noupdate /network_tb/rst
add wave -noupdate -divider {Neuron - Last layer}
add wave -noupdate -label Ctrl -radix symbolic {/network_tb/network_full/full_network/layer_output/genblk1[1]/neuron_layer_generate/neuron_main_data/ctrl_vec}
add wave -noupdate -label {To be added} -radix decimal {/network_tb/network_full/full_network/layer_output/genblk1[1]/neuron_layer_generate/neuron_main_data/data_out_register_2}
add wave -noupdate -label Membrane -radix decimal {/network_tb/network_full/full_network/layer_output/genblk1[1]/neuron_layer_generate/neuron_main_data/data_in_1_comp}
add wave -noupdate -label Threshold -radix decimal {/network_tb/network_full/full_network/layer_output/genblk1[1]/neuron_layer_generate/neuron_main_data/data_in_2_comp}
add wave -noupdate -label Decision {/network_tb/network_full/full_network/layer_output/genblk1[1]/neuron_layer_generate/neuron_main_data/data_out}
add wave -noupdate -divider {Arbiter decision}
add wave -noupdate -label {Arbiter decision} -radix unsigned /network_tb/network_full/full_network/layer_output/memory_layer/addr_one_hot
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {179 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 173
configure wave -valuecolwidth 85
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {2626 ns}

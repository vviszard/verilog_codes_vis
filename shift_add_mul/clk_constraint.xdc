create_clock -period 10.000 -name clk [get_ports clk]

set_input_delay -clock clk -max 2.000 [get_ports start]
set_input_delay -clock clk -min 0.500 [get_ports start]
set_input_delay -clock clk -max 2.000 [get_ports {a[*]}]
set_input_delay -clock clk -min 0.500 [get_ports {a[*]}]
set_input_delay -clock clk -max 2.000 [get_ports {q[*]}]
set_input_delay -clock clk -min 0.500 [get_ports {q[*]}]

set_output_delay -clock clk -max 2.000 [get_ports done]
set_output_delay -clock clk -min 0.500 [get_ports done]
set_output_delay -clock clk -max 2.000 [get_ports {P[*]}]
set_output_delay -clock clk -min 0.500 [get_ports {P[*]}]

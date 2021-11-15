vlib work
vlog check3.sv 
vlog tb.sv
vsim work.tb +debug=1 +tracefile=input_textfile.txt
run -all
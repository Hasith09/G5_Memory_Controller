module tb;

logic clk;
 
check3 dut_inst(clk);



always  #5 clk=!clk;
initial begin 
clk=5;

#2000;
$stop;

end
endmodule

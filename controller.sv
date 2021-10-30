module controller_tb;

int file,cycle_time;
	logic flag;
string filename, input_line;
logic [1:0] operation;
	logic [36:0] hex_address;

initial
begin
if($value$plusargs("tracefile=%s", filename))
 begin
			file = $fopen(filename, "r");
			if (file == 0) 
			begin
				$display ("ERROR: file.txt not opened");
				$stop;
			end
			else
			begin
				while(!$feof(file))
			begin
				$fgets(input_line,file);
				$sscanf(input_line,"%d %d %h",cycle_time,operation,hex_address);
				if(flag)
				$display("%d %d %h",cycle_time,operation,hex_address);
			end
			end
end
end
endmodule

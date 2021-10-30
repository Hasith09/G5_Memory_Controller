module controller_tb;

int file,cycle_time;
string filename, scan_input;
logic [1:0] operation;
logic [36:0] address;

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
			while(!$feo(file))
			begin
				$fgets(scan_input,file);
				$sscanf(scan_input,"%d %d %h",cycle_time,operation,address);
				$display("%d %d %h",cycle_time,operation,address);
			end
			end
end
end
endmodule
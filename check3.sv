module check3(input clk);

int file,cycletime;
logic debug;
string filename, scan_input;
logic [1:0] operation;
logic [36:0] address;
string queue [$:16];
int countarray [15:0];
event push_after_pop;
string pop_element;
int spaces;


initial
begin
if($value$plusargs("tracefile=%s", filename))
if($value$plusargs("debug=%d", debug))
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
				$fgets(scan_input,file);
				if (queue.size() <16 )
						begin
							 $sscanf(scan_input,"%d %d %h",cycletime,operation,address);
							queue.push_back(scan_input);
							countarray[queue.size()-1]=$time;
							$display("Time at which data is inserted into queue is %0t and ",$time," ", "inserted data into queue is %d %d %h",cycletime,operation,address);
						end
					else
					
						begin
							@push_after_pop;
							$sscanf(scan_input,"%d %d %h",cycletime,operation,address);
							queue.push_back(scan_input);
							countarray[15]=$time;
							$display("Time at which data is inserted into queue is %0t and ",$time," ", "inserted data into queue is %d %d %h",cycletime,operation,address);
							
						end
						
			end
			if(debug)
				$display("cycletime:%d operation:%d address:%h",cycletime,operation,address);
			end
			end
end

always @(posedge clk)
begin
	for (int i=0; i <16;i++)
	begin
		if(countarray[i]+1000==$time)
		begin
			pop_element= queue.pop_front();
			$display("time at the element %s popped out is %0t",pop_element,$time);
			->push_after_pop;
		end
	end
end
endmodule



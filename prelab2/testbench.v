`timescale 1ns / 1ns
module testbench();

reg [6:0] x;
wire [2:0] y;
wire z;
reg [1:0] s;

integer i;
integer j;

encoder name(y, x);
mux name_2(z, y, s);

initial begin
	$dumpfile("TimingDiagram.vcd");
	$dumpvars(0, z, y, s, x);

	x = 0;
	s = 0;

	for (i = 0; i < 4; i++) begin
		s = i;
		for (j = 0; j < 64; j++) begin
			x = j;
			#10;
		end
	end

	$finish;
end

endmodule

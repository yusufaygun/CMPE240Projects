`timescale 1ns / 1ns

module encoder(y, x);

// Implement here

input wire [6:0] x;
output reg[2:0] y;

always @(x) begin
    case (x[6] + x[5] + x[4] + x[3] + x[2] + x[1] + x[0])
        3'b001: begin
            y <= 3'b001;
        end
        3'b010: begin
            y <= 3'b010;
        end
        3'b011: begin
            y <= 3'b011;
        end
        3'b100: begin
            y <= 3'b100;
        end
        3'b101: begin
            y <= 3'b101;
        end
        3'b110: begin
            y <= 3'b110;
        end
        3'b111: begin
            y <= 3'b111;
        end
        default: y <= 3'b000;
    endcase
end   


endmodule

module mux(z, y, s);

// Implement here

input wire [2:0] y;
input wire [1:0] s;
parameter 	S0 = 2'b00,
			S1 = 2'b01,
			S2 = 2'b10,
			S3 = 2'b11;

output reg z;

always @(s, y)
    begin

        if (s == S0) begin
    	    z <= ~y[2] & ~y[1] & ~y[0];
	    end

	    else if (s == S1) begin
		    z <= (~y[2] & ~y[1] & y[0]) | (~y[2] & y[1] & ~y[0]) | (y[2] & ~y[1] & ~y[0]);
	    end

	    else if (s == S2) begin
		    z <= (y[2] & y[1] & ~y[0]) | (y[2] & ~y[1] & y[0]) | (~y[2] & y[1] & y[0]);
	    end

	    else begin
            z <= y[2] & y[1] & y[0];
        end
    
    end

endmodule
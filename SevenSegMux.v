module SevenSegMux(
output reg [3:0] out, 
input [3:0] a, b, c, d, 
input [1:0] sel
    );
	 
always @(sel, a, b, c, d)
case(sel)
	0:	out=a;
	1:	out=b;
	2:	out=c;
	3:	out=d;
default: out=4'bx;
endcase
endmodule
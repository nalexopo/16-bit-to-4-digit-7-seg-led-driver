module top4digit7seg(
input clk,rst,
input [15:0] bin,
output [7:0] abcdefg,
output  en0, en1, en2, en3//reg???
);
wire [1:0] sel;
wire nclk;
wire [3:0] ssmout;
wire [15:0]bcd;
dbldbl dbldbl1(
.bin(bin),
.bcd(bcd)
	 );
	 
SevenSegMux SevenSegMux(
.out(ssmout), 
.a(bcd[15:12]),
.b(bcd[11:8]),
.c(bcd[7:4]),
.d(bcd[3:0]),  
.sel(sel)
    );

SevenSegEnc SevenSegEnc(
	.Disp(abcdefg),
	.BCD(ssmout)
);

Selector Selector(
.o0(en0),
.o1(en1), 
.o2(en2),
.o3(en3),
.sel(sel)
);

counttofour counttofour(
.clk(nclk),
.rst(rst),
.cnt(sel)
); 

foursegclk foursegclk(
.clk(clk),
.rst(rst),
.nclk(nclk)

);

endmodule

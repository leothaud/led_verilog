module LED #( parameter PERIOD = 120 )
   (
    input  clk,
    output reg led = 0
    );
    
    reg [15:0] bram_in = 0;
    wire [15:0] bram_out;
    reg [7:0] bram_read_addr = 0;
    reg [7:0] bram_write_addr = 0;
//    reg [15:0] mask;
    reg RE = 1;
    reg WE = 0;
    
    
    BRAM counter(
      .clk(clk),
      .WDATA(bram_in),
//      .MASK(~0),
      .WADDR(bram_write_addr),
      .WE(WE),
      .RDATA(bram_out),
      .RADDR(bram_read_addr),
      .RE(RE));
   

   always @(posedge clk) begin
      WE <= 1;
      if (bram_out == PERIOD) begin
        bram_in <= 0;
        led <= ~led;
      end else begin
        bram_in <= bram_out + 1;
      end
   end   
   
endmodule



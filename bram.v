module BRAM
(
  input clk,
  
  input [15:0] WDATA,
//  input [15:0] MASK,
  input [7:0] WADDR,
  input WE,
  
  output reg [15:0] RDATA,
  input [7:0] RADDR,
  input RE
);

reg [15:0] mem [255:0];

always @(posedge clk) begin
  if (RE) begin
    RDATA <= mem[RADDR];
  end
  if (WE) begin
      mem[WADDR] <= WDATA;
//    mem[WADDR] <= (mem[WADDR] & (~MASK)) | (WDATA & MASK);
  end
end

endmodule

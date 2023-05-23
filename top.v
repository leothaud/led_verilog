`timescale 1ns/10ps;

module TOP
  (
   output wire led_r,
   output wire led_g,
   output wire led_b
  );


`ifdef SIM

   reg         clk = 0;
   always begin
      #(31);
      clk = ~clk;
   end 

   
   
`else // !`ifdef SIM
   
   wire        int_osc;
   wire clk;
   
   
   SB_HFOSC  u_SB_HFOSC(.CLKHFPU(32'd1), .CLKHFEN(32'd1), .CLKHF(int_osc));
   pll pll(.clock_in(int_osc), .clock_out(clk));
   

`endif // !`ifdef SIM


   LED #(.PERIOD(10)) ledr (.clk(clk), .led(led_r));
   LED #(.PERIOD(15)) ledg (.clk(clk), .led(led_g));
   LED #(.PERIOD(20)) ledb (.clk(clk), .led(led_b));

endmodule

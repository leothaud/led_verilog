`timescale 1ns/10ps;


module testbench ();

   wire led_r;
   wire led_g;
   wire led_b;
   
   
   TOP top(.led_r(led_r), .led_g(led_g), .led_b(led_b));

   initial begin
      $dumpfile("led.vcd");
      $dumpvars(0, testbench);
      #(1000000000);
      $finish();
   end
   
endmodule

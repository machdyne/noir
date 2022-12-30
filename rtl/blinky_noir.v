// NOIR BLINKY

module blinky
#(
)
(

	input CLK_48,

	output LED_R,
	output LED_G,
	output LED_B,

);

	reg [28:0] counter = 0;

	assign LED_G = 1;
	assign LED_B = 1;
   assign LED_R = ~counter[25];

   always @(posedge CLK_48) begin
      counter <= counter + 1;
   end

endmodule

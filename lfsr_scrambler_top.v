module lfsr_scrambler_top(
  input clk,
  input [7:0] data_in,
  output reg [7:0] data_out
);

  reg [7:0] shift_register;

  // Generate a new random number every clock cycle
  always @(posedge clk) begin
    // Shift the contents of the shift register
    shift_register <= {shift_register[6:0], shift_register[7]};

    // Generate a new random bit and insert it into the shift register
    shift_register[0] <= shift_register[5] ^ shift_register[7];

    // Drive data_out from the MSB of the shift register
    data_out <= shift_register[7:0];
  end

endmodule
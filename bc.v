module case_1( 
  input clk ,
  output reg [31:0] counter
);

  initial begin
    counter = 'b0;
  end

  always @ (posedge clk) begin
    counter <=counter +1;
  end

endmodule

module counter (input clk , output wire [31:0] counter );
  case_1 h1  ( .clk(clk) , . counter(counter) );
endmodule
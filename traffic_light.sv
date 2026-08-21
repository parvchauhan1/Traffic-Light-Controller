module traffic_light(
  input clk,
  input rst_n,
  output reg red,
  output reg yellow,
  output reg green
);
//States
parameter GREEN=2'b00;
parameter YELLOW=2'b01;
parameter RED=2'b10;
//Timer counts
parameter GREEN_TIME=5;
parameter YELLOW_TIME=2;
parameter RED_TIME=5;

  reg [1:0] state;
  reg [2:0] timer;
  
  always @ (posedge clk)
    begin
    if (!rst_n)
    begin
      state <= GREEN;
      timer <= 0;
      red <= 0;
      yellow <= 0;
      green <= 1;
    end
      else 
        begin
          case(state)
            GREEN: begin
              red <= 0;
      		  yellow <= 0;
      		  green <= 1;
              if(timer==GREEN_TIME-1)
                begin
                state <= YELLOW;
                timer <= 0;
                end
              else
                timer <= timer+1;
            end
            YELLOW:begin
              red <= 0;
      		  yellow <= 1;
      		  green <= 0;
              if(timer==YELLOW_TIME-1)
                begin
                state <= RED;
                timer <= 0;
                end
              else
                timer <= timer+1;
            end
            RED:begin
              red <= 1;
      		  yellow <= 0;
      		  green <= 0;
              if(timer==RED_TIME-1)
                begin
                state <= GREEN;
                timer <= 0;
                end
              else
                timer <= timer+1;
            end
          endcase
        end
    end
endmodule

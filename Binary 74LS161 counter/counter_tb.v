`timescale 1ns/10ps
module counter_tb();
reg clk, reset, load, enp, ent;
reg [3:0] D_input;
wire [3:0]Q_output;
wire rco;

counter dut( .D(D_input),  .CLK(clk),  .CLR_n(reset),  .LOAD_n(load),  .ENP(enp),  .ENT(ent),  .Q(Q_output),   .RCO(rco));

//producing clock for sim
initial begin 
clk=0;
forever #5 clk=~clk;
end

//controlling the reset signal
initial begin
reset=1;
#21;
reset=0;   //active-low reset
#2;
reset=1;   //active-low reset
end
//controlling the load signal
initial begin
load=0;
#22;
load=1;   
#4;
load=0;   
end

//controlling enp and ent signals
initial begin
ent = 0; enp = 0;
#30;
ent = 1;
#5;
enp = 1;
#25
ent = 0;
end

//controlling the load signal
initial begin
D_input = 4'b0010;

end

endmodule 
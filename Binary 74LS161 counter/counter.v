module counter(input [3:0]D, input CLK, input CLR_n, input LOAD_n, input ENP, input ENT, output reg [3:0]Q, output reg RCO);


   
always@ (CLR_n or posedge CLK)
if(!CLR_n)
   Q = 4'b0000;
else if(LOAD_n)
   Q = D;
else if(ENP & ENT)
   begin
       if( Q == 4'b1110)
         RCO = 1;
       else
         RCO = 0;
       Q = Q +1;
   end
endmodule

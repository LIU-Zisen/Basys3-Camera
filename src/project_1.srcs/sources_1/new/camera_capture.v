`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/12/03 21:55:34
// Design Name: 
// Module Name: camera_capture
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ov7670_capture(
input pclk,
input vsync,
input href,
input[7:0] d,
output[16:0] addr,
output [11:0] dout,
output reg we
    );
    reg [15:0] d_latch;
    reg [16:0] address;
    reg [16:0] address_next;  
     reg [1:0] wr_hold;    
     reg [1:0] cnt;
     reg [11:0] dout1;
  initial d_latch = 16'b0;
   initial address = 19'b0;
   initial address_next = 19'b0;
    initial wr_hold = 2'b0;   
    initial cnt = 2'b0;        
assign addr =    address;

always@(posedge pclk)begin 
 if( vsync ==1) begin
           address <=17'b0;
           address_next <= 17'b0;
           wr_hold <=  2'b0;
           cnt <=  2'b0;
           end
        else begin
           if(address<76800)
           address <= address_next;
           else
           address <= 76800;
           we      <= wr_hold[1];
           wr_hold <= {wr_hold[0] , (href &&( ! wr_hold[0])) };  //���ñ���д�������
           d_latch <= {d_latch[7:0] , d};

           if (wr_hold[1] ==1 )begin  //���õ�һ��������������Ϣ�󣬽���16-12λ��ת��
              
              address_next <=address_next+1;

             dout1[11:0]  <= {d_latch[15:12] , d_latch[10:7] , d_latch[4:1] };
             
      
           end

        end;
 end
assign dout = dout1;
endmodule

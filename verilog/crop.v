module Crop#(parameter width =768,height = 512)(left,right,top,bottom);
  input [15:0] left,right,top,bottom;
  integer inp_file [0:width*height*3 -1];
  initial 
  begin
      $readmemh("./Images/test.hex", inp_file);
  end
  initial begin :test    
    integer i,j,RealR,RealB,RealG;
    for(i=0; i<height; i=i+1) begin
      for(j=0; j<width; j=j+1) begin
        if(i<=top || i>=height-bottom || j<=left || j>=width -right) begin
          inp_file[width*3*(height-i-1)+3*j+0] = 255;
          inp_file[width*3*(height-i-1)+3*j+1] = 255;
          inp_file[width*3*(height-i-1)+3*j+2] = 255;
        end
      end
    end
  end
  initial begin
    $writememh("./Images/output.hex", inp_file);
  end
endmodule
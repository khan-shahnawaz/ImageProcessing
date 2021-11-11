module Sepia #(parameter height=512, width = 768)(sel);
  integer inp_file [0:width*height*3 -1];
  input [1:0] sel;
  integer i,j,RealR,RealB,RealG,k,f;
  initial 
  begin
      $readmemh("./Images/test1.hex", inp_file);
  end
  initial begin :test    
    for(i=0; i<height; i=i+1) begin
      for(j=0; j<width; j=j+1) begin
        RealR =inp_file[width*3*(height-i-1)+3*j+0]; // save Red component
        RealG = inp_file[width*3*(height-i-1)+3*j+1];// save Green component
        RealB = inp_file[width*3*(height-i-1)+3*j+2];// save Blue component
        inp_file[width*3*(height-i-1)+3*j+0] = 0.393*RealR + 0.769*RealG + 0.189*RealB;
        inp_file[width*3*(height-i-1)+3*j+1] = 0.349*RealR + 0.686*RealG + 0.168*RealB;
        inp_file[width*3*(height-i-1)+3*j+2] = 0.272*RealR + 0.534*RealG + 0.131*RealB;
      end
    end
  end
  initial begin:t
        k=0;
        f=$fopen("./Images/output.hex","wb");
        //genvar i,j;
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
                 $fwrite(f,"%2x\n",inp_file[k]);
                 $fwrite(f,"%2x\n",inp_file[k+1]);
                 $fwrite(f,"%2x\n",inp_file[k+2]);
                 k=k+3;
            end
        end
         $fclose(f);  
         $display("%d",k);
    end
endmodule
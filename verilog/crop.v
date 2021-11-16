module Crop();
    integer i,j,k=0,left,right,bottom,top,f,height,width;
    integer size[0:5];
    integer inp_file[0:9000000];
    initial begin
        $readmemh("./data/size.hex", size);
        height = size[0];
        width = size[1];
        top = size[2];
        bottom = size[3];
        left = size[4];
        right = size[5];
    end
    initial 
    begin        
        $readmemh("./data/temp.hex", inp_file);
      end
  initial begin:t
        k=0;
        f=$fopen("./data/output.hex","wb");
        //genvar i,j;
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
              if(i>=bottom && i<=height- top && j<=height - right && j>=left) begin
                 $fwrite(f,"%2x\n",inp_file[k]);
                 $fwrite(f,"%2x\n",inp_file[k+1]);
                 $fwrite(f,"%2x\n",inp_file[k+2]);
               end
                 k=k+3;
            end
        end
         $fclose(f);  
    end
endmodule
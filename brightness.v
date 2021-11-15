module brightness ();
    integer i,j,k;
    integer size[0:3];
    integer f,tempred,tempblue,tempgreen,height,width,brightness,sign;
    integer inp_file[0:9000000];
    initial begin
        $readmemh("./data/size.hex", size);
        height = size[0];
        width = size[1];
        brightness=size[2];
        sign=size[3];
    end
    initial 
    begin        
        $readmemh("./data/temp.hex", inp_file);
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
                tempred = inp_file[width*3*(height-i-1)+3*j+0]; 
                tempgreen = inp_file[width*3*(height-i-1)+3*j+1];
                tempblue = inp_file[width*3*(height-i-1)+3*j+2];
                if (sign==0) begin
                inp_file[width*3*(height-i-1)+3*j+0]=tempred+brightness;
                if (tempred+brightness>255) inp_file[width*3*(height-i-1)+3*j+0]=255;
                inp_file[width*3*(height-i-1)+3*j+1]=tempgreen+brightness;
                if (tempgreen+brightness>255) inp_file[width*3*(height-i-1)+3*j+1]=255;
                inp_file[width*3*(height-i-1)+3*j+2]=tempblue+brightness;
                if (tempblue+brightness>255) inp_file[width*3*(height-i-1)+3*j+2]=255;
                end
                else begin
                inp_file[width*3*(height-i-1)+3*j+0]=tempred-brightness;
                if (tempred<brightness) inp_file[width*3*(height-i-1)+3*j+0]=0;
                inp_file[width*3*(height-i-1)+3*j+1]=tempgreen-brightness;
                if (tempgreen<brightness) inp_file[width*3*(height-i-1)+3*j+1]=0;
                inp_file[width*3*(height-i-1)+3*j+2]=tempblue-brightness;
                if (tempblue<brightness) inp_file[width*3*(height-i-1)+3*j+2]=0;
                end
            end
        end
    end
    initial begin:t
        k=0;
        f=$fopen("./data/output.hex","wb");
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
         //$display("%d",k);
    end
endmodule
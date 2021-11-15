module sepia ();
    integer i,j,k;
    integer size[0:1];
    integer f,RealR,RealG,RealB,height,width;
    integer inp_file[0:9000000];
    initial begin
        $readmemh("./data/size.hex", size);
        height = size[0];
        width = size[1];
    end
    initial 
    begin        
        $readmemh("./data/temp.hex", inp_file);
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
                RealR = inp_file[width*3*(height-i-1)+3*j+0]; 
                RealG = inp_file[width*3*(height-i-1)+3*j+1];
                RealB = inp_file[width*3*(height-i-1)+3*j+2];
                inp_file[width*3*(height-i-1)+3*j+0] = 0.393*RealR + 0.769*RealG + 0.189*RealB;
                inp_file[width*3*(height-i-1)+3*j+1] = 0.349*RealR + 0.686*RealG + 0.168*RealB;
                inp_file[width*3*(height-i-1)+3*j+2] = 0.272*RealR + 0.534*RealG + 0.131*RealB;
                
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
    end
endmodule
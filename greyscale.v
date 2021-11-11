module Gray #(parameter height=512, width = 768)();
    integer inp_file [0:width*height*3-1];
    integer i,j,k;
    integer f;
    initial 
    begin
        $readmemh("./data/temp.hex", inp_file);
    end
    integer tempred,tempblue,tempgreen;
    initial begin :test
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
     // Matlab code writes image from the last row to the first row
     // Verilog code does the same in reading to correctly save image pixels into 3 separate RGB mem
                tempred = inp_file[width*3*(height-i-1)+3*j+0]; // save Red component
                tempgreen = inp_file[width*3*(height-i-1)+3*j+1];// save Green component
                tempblue = inp_file[width*3*(height-i-1)+3*j+2];// save Blue component
                inp_file[width*3*(height-i-1)+3*j+0]=(tempred+tempgreen+tempblue)/3;
                inp_file[width*3*(height-i-1)+3*j+1]=(tempred+tempgreen+tempblue)/3;
                inp_file[width*3*(height-i-1)+3*j+2]=(tempred+tempgreen+tempblue)/3;
                
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
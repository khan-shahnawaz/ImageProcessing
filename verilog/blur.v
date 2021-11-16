module Blur ();
    integer i,j,k=0;
    integer size[0:1];
    integer f,height,width,sumr,sumg,sumb,cnt;
    integer inp_file[0:9000000];
    initial begin
        $readmemh("./data/size.hex", size);
        height = size[0];
        width = size[1];
    end
    integer tempred[0:9000000],tempblue[0: 9000000],tempgreen[0:9000000];
    initial begin
        $readmemh("./data/temp.hex", inp_file);
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
                tempred[width*i +j] = inp_file[width*3*(height-i-1)+3*j+0]; // save Red component
                tempgreen[width*i +j] = inp_file[width*3*(height-i-1)+3*j+1];// save Green component
                tempblue[width*i +j] = inp_file[width*3*(height-i-1)+3*j+2];// save Blue component
            end
        end
        for(i=0;i<height;i=i+1) begin
            for(j=0;j<width; j=j+1) begin
                sumr=tempred[width*(i)+j];
                sumg=tempgreen[width*(i)+j];
                sumb=tempblue[width*(i)+j]; 
                cnt=1;
                // if(i>0 && j>0) begin
                //     cnt=cnt+1;
                //     sumr+= tempred[width*(i-1)+j-1];
                //     sumg+= tempgreen[width*(i-1)+j-1];
                //     sumb+= tempblue[width*(i-1)+j-1];
                // end
                if(i>0) begin
                    cnt=cnt+1;
                    sumr+= tempred[width*(i-1)+j];
                    sumg+= tempgreen[width*(i-1)+j];
                    sumb+= tempblue[width*(i-1)+j];
                end
                // if(i>0 && j<width-1) begin
                //     cnt=cnt+1;
                //     sumr+= tempred[width*(i-1)+j+1];
                //     sumg+= tempgreen[width*(i-1)+j+1];
                //     sumb+= tempblue[width*(i-1)+j+1];
                // end
                if(j>0) begin
                    cnt=cnt+1;
                    sumr+= tempred[width*(i)+j-1];
                    sumg+= tempgreen[width*(i)+j-1];
                    sumb+= tempblue[width*(i)+j-1];
                end
                if(j<width -1) begin
                    cnt=cnt+1;
                    sumr+= tempred[width*(i)+j+1];
                    sumg+= tempgreen[width*(i)+j+1];
                    sumb+= tempblue[width*(i)+j+1];
                end
                // if(i<height-1 && j>0) begin
                //     cnt=cnt+1;
                //     sumr+= tempred[width*(i+1)+j-1];
                //     sumg+= tempgreen[width*(i+1)+j-1];
                //     sumb+= tempblue[width*(i+1)+j-1];
                // end
                // if(i<height-1) begin
                //     cnt=cnt+1;
                //     sumr+= tempred[width*(i+1)+j];
                //     sumg+= tempgreen[width*(i+1)+j];
                //     sumb+= tempblue[width*(i+1)+j];
                // end
                // if(i<height-1 && j<width-1) begin
                //     cnt=cnt+1;
                //     sumr+= tempred[width*(i+1)+j+1];
                //     sumg+= tempgreen[width*(i+1)+j+1];
                //     sumb+= tempblue[width*(i+1)+j+1];
                // end
                // inp_file[width*3*(height-i-1)+3*j+0] = sumr/cnt;
                // inp_file[width*3*(height-i-1)+3*j+1] = sumg/cnt;
                // inp_file[width*3*(height-i-1)+3*j+2] = sumb/cnt;   
                if(i>=200 && i<=300 && j>=300 && j<=400) begin
                    inp_file[width*3*(height-i-1)+3*j+0] = 0;
                    inp_file[width*3*(height-i-1)+3*j+1] = 0;
                    inp_file[width*3*(height-i-1)+3*j+2] = 0;
                end
            end
        end
    end
    initial begin:t
        f=$fopen("./data/output.hex","wb");
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

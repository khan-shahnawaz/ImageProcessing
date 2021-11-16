module Blur ();
    integer i,j,k=0;
    integer size[0:2];
    integer f,height,width,sumr,sumg,sumb,cnt,ti,tj;
    integer inp_file[0:9000000];
    integer order;
    initial begin
        $readmemh("./data/size.hex", size);
        height = size[1];
        width = size[0];
        order=size[2];
    end
    integer tempred[0:3000000],tempblue[0: 3000000],tempgreen[0:3000000];
    initial begin
        k=0;
        $readmemh("./data/temp.hex", inp_file);
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
                tempred[width*i +j] = inp_file[k+0]; // save Red component
                tempgreen[width*i +j] = inp_file[k+1];// save Green component
                tempblue[width*i +j] = inp_file[k+2];// save Blue component
                k=k+3;
            end
        end
        k=0;
        cnt=0;
        //$display("%x",tempred[3]);
        for(i=order/2;i<height-order/2;i=i+1) begin
            for(j=order/2;j<width-order/2; j=j+1) begin
                sumr=0;
                sumb=0;
                sumg=0;
                cnt=0;
                k=i*width*3+3*j;
                for (ti=i-order/2;ti<=i+order/2;ti=ti+1) begin
                  for (tj=j-order/2;tj<=j+order/2;tj=tj+1) begin
                    sumr+=tempred[width*ti +tj];
                    sumg+=tempgreen[width*ti +tj];
                    sumb+=tempblue[width*ti +tj];
                    cnt+=1;
                //    if (tj==767 && ti==511) $display("%x %x %d",sumr,tempred[393215],k);
                  end
                end
                inp_file[k]=sumr/cnt; 
              //  if (j==767 && i==511) $display("%x %x %d %x",sumr,tempred[393215],k,inp_file[k]);
                inp_file[k+1]=sumg/cnt; 
                inp_file[k+2]=sumb/cnt;
            end
        end
       // $display("%x",inp_file[9]);
    end
    initial begin:t
        k=0;
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
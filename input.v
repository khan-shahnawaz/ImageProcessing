module read #(parameter height=512, width = 768)();
    integer inp_file [0:width*height*3-1];
    initial 
    begin
        $readmemh("./Images/test.hex", inp_file);
    end
    integer org_R [0:width*height-1];
        integer org_G [0:width*height-1];
        integer org_B [0:width*height-1];
    initial begin :test

        integer i,j;
        for(i=0; i<height; i=i+1) begin
            for(j=0; j<width; j=j+1) begin
     // Matlab code writes image from the last row to the first row
     // Verilog code does the same in reading to correctly save image pixels into 3 separate RGB mem
                org_R[width*i+j] = inp_file[width*3*(height-i-1)+3*j+0]; // save Red component
                org_G[width*i+j] = inp_file[width*3*(height-i-1)+3*j+1];// save Green component
                org_B[width*i+j] = inp_file[width*3*(height-i-1)+3*j+2];// save Blue component
            end
        end
    end
    initial begin
        $writememh("./Images/output.hex", inp_file);
    end
endmodule
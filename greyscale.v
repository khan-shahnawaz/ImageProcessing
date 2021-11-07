module Gray #(parameter height=256, width = 256)();
    integer inp_file [0:width*height*3-1];
    initial 
    begin
        $readmemh("./Images/test1.hex", inp_file);
    end
    integer tempred,tempblue,tempgreen;
    initial begin :test
        
        integer i,j;
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
    initial begin
        $writememh("./Images/output.hex", inp_file);
    end
endmodule
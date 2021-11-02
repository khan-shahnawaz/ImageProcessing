module imageRead();
	reg Width,Height;
	integer temp_BMP   [0 : WIDTH*HEIGHT*3 - 1];  
	parameter sizeOfWidth = 8;   // data width
	parameter sizeOfLengthReal = 3*Width*Height;   // image data : 
	integer temp_BMP   [0 : WIDTH*HEIGHT*3 - 1]; 
	integer org_R  [0 : WIDTH*HEIGHT - 1];  // temporary storage for R component
	integer org_G  [0 : WIDTH*HEIGHT - 1]; // temporary storage for G component
	integer org_B  [0 : WIDTH*HEIGHT - 1];  // temporary storage for B component
	initial begin
  $readmemh("path/to/bmp",total_memory,0,sizeOfLengthReal-1); // read file from INFILE
	end
	always@(start) begin
    if(start == 1'b1) begin
        for(i=0; i<WIDTH*HEIGHT*3 ; i=i+1) begin
            temp_BMP[i] = total_memory[i+0][7:0]; 
        end
        
        for(i=0; i<HEIGHT; i=i+1) begin
            for(j=0; j<WIDTH; j=j+1) begin
     // Matlab code writes image from the last row to the first row
     // Verilog code does the same in reading to correctly save image pixels into 3 separate RGB mem
                org_R[WIDTH*i+j] = temp_BMP[WIDTH*3*(HEIGHT-i-1)+3*j+0]; // save Red component
                org_G[WIDTH*i+j] = temp_BMP[WIDTH*3*(HEIGHT-i-1)+3*j+1];// save Green component
                org_B[WIDTH*i+j] = temp_BMP[WIDTH*3*(HEIGHT-i-1)+3*j+2];// save Blue component
            end
        end
    end
	end
}

module imageRead(orgR,orgG,orgB);
	parameter Width = 500;
	parameter Height =333;
	//integer Width,Height;  
	parameter sizeOfWidth = 8;   // data Width
	parameter sizeOfLengthReal = 3*Width*Height;   // image data : 
	reg [7 : 0]   totalMemory [0 : sizeOfLengthReal-1];
	integer tempBMP   [0 : Width*Height*3 - 1]; 
	output integer orgR  [0 : Width*Height - 1];  // temporary storage for R component
	output integer orgG  [0 : Width*Height - 1]; // temporary storage for G component
	output integer orgB  [0 : Width*Height - 1];  // temporary storage for B component
	initial begin
  $readmemh("./Images/test1.hex",totalMemory,0,sizeOfLengthReal-1); // read file from the .hex file
	end
	always@ * begin : test
		integer i,j;
    for( i=0; i<Width*Height*3 ; i=i+1) begin
        tempBMP[i] = totalMemory[i+0][7:0]; 
    end 
    for(i=0; i<Height; i=i+1) begin
      for(j=0; j<Width; j=j+1) begin
		 // Matlab code writes image from the last row to the first row
		 // Verilog code does the same in reading to correctly save image pixels into 3 separate RGB mem
        orgR[Width*i+j] = tempBMP[Width*3*(Height-i-1)+3*j+0]; // save Red component
        orgG[Width*i+j] = tempBMP[Width*3*(Height-i-1)+3*j+1];// save Green component
        orgB[Width*i+j] = tempBMP[Width*3*(Height-i-1)+3*j+2];// save Blue component
	    end
    end
	end
	//Sepia testSepia(.orgR(orgR),.orgB(orgB),.orgG(orgG),.Width(Width),.Height(Height));
endmodule // imageRead

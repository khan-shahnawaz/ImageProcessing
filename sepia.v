module Sepia();
	 integer orgR[0 : 500*333 - 1];
	 integer orgG[0 : 500*333 - 1];
	 integer orgB[0 : 500*333 - 1];
	imageRead test(.orgR(orgR),.orgG(orgG),.orgB(orgB));
	always @* begin: test1
		integer i,j;
		integer realR ;		//Storing original R component
    integer realG ;		//Storing original G component
		integer realB ;		//Storing original B component
	 	for(i=0; i<500; i=i+1) begin
    	for(j=0; j<333; j=j+1) begin
    	 	 realR <= orgR[500*i+j];		//Storing original R component
    	 	 realG <= orgG[500*i+j];		//Storing original G component
    	 	 realB <= orgB[500*i+j];		//Storing original B component
      	 orgR[500*i+j] <= 0.393*realR + 0.769*realG + 0.189*realB; //Modifying R component
      	 orgG[500*i+j] <= 0.349*realR + 0.686*realG + 0.168*realB; //Modifying G component
      	 orgB[500*i+j] <= 0.349*realR + 0.686*realG + 0.168*realB; //Modifying B component
    	end
  	end
	end
endmodule // Sepia

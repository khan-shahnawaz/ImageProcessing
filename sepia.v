module Sepia(orgR,orgB,orgG,Width,Height);
	input integer Width,Height;
	input integer orgR[0 : Width*Height - 1];
	input integer orgG[0 : Width*Height - 1];
	input integer orgB[0 : Width*Height - 1];
	imageRead test(.orgR(.orgR),.orgG(orgG),.orgB(orgB));
	integer Width, Height,i,j;
	
	for(i=0; i<Height; i=i+1) begin
    for(j=0; j<Width; j=j+1) begin
    	integer realR = orgR[Width*i+j];		//Storing original R component
    	integer realG = orgG[Width*i+j];		//Storing original R component
    	integer realB = orgB[Width*i+j];		//Storing original R component
      orgR[Width*i+j] = 0.393*realR + 0.769*realG + 0.189*realB; //Modifying R component
      orgG[Width*i+j] = 0.349*realR + 0.686*realG + 0.168*realB; //Modifying G component
      orgB[Width*i+j] = 0.349*realR + 0.686*realG + 0.168*realB; //Modifying B component
    end
  end
 endmodule // Sepia

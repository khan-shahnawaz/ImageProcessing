module read #(parameter width =768,height = 512)(sel,left,right,top,bottom);
    input [1:0] sel;
    input [15:0] left,right,top,bottom;
    Gray #(.height(height),.width(width)) gray(.sel(sel));  // if sel ==0;
    Sepia #(.height(height),.width(width)) sepia(.sel(sel)); // if sel ==1
    Crop #(.height(height),.width(width)) crop(.sel(sel),.left(left),.right(right),.bottom(bottom),.top(top)); // if sel ==2
    Blur #(.height(height),.width(width)) blur(.sel(sel)); // if sel ==3
endmodule
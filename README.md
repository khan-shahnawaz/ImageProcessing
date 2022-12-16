# Image Processing with Verilog
CS203-Group Project under Dr. Neeraj Goel

Members:  
Shahnawaz Khan: 2020csb1123  
Vishnusai Janjanam: 2020csb1142  
Vinit Hagone: 2020csb1361

## Objective: 
- To use Verilog for image processing.  
- Implement the filters like blur, grayscale, sepia, brightness control of the image and crop functionality. 


## Functionality:  

- Verilog is used as it is an RTL(Register Transfer Level) idea. We are using Behavioural modelling in the implementation.  
- First, the image file (of definite pixels) is converted to a .hex file as Verilog cannot read images directly. 
- Then the .hex file is read as a 2-D array and the RGB values are seperated. 
- After that known algorithms for filters like grayscale, sepia, blur are applied according to the need. Other than that cropping of the image as per input is also possible. 
- At last, the hex file is converted back to jpg using external software(python) yields the desired result.

## Requriements:

- Python 3.7 or above, ktinker and pillow library. These can be downloaded using pip command 

- The command prompt should be able to compile and run verilog files by the command (iverilog file.v, then vvp a.out).

# How to run:

* Clone the project into a seperate folder.  
```bash
git clone https://github.com/skhan-org/ImageProcessing.git
```
* Set the current directory as the  project directory which contains main.py.

* Run main.py through python 3. 
```bash
python3 main.py 
```
* Follow the on screen instructions for processing the image.

*Note : Blur with option High can be too slow on some systems.*

## Intermediate Submission:

* Added input module
* Added grayscale and Sepia
* Added crop module
* Input and Outputs specified for Blur
* BMP file converted to Hex

Tasks to be done:
* Completion of blur module
* Addition of testbench
* Output conversion directly to BMP.

## Final Submission:
* Added module for brightness control and blur
* Linked verilog files to python for better user Experience.
* Images are now automatically converted to hex and processed hex is now automatically saved back to image using python Pillow and tkinker module.
* Fixed some bugs.

*Note : These files will work only for images with less than or equal to 3000000 pixels. Some modification needs to be done in the code for making it available for images with large pixels.*

Check the images section for sample output.

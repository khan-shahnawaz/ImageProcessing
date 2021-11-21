# CS203_Project2021
CS203-Group Project

Members:
Shahnawaz Khan: 2020csb1123
Vishnusai Janjanam: 2020csb1142
Vinit Hagone: 2020csb1361


			IMAGE PROCESSING(Filter and Crop of BMP files)
Objective: To use Verilog for image processing.

We will be using Verilog as it is an RTL idea. We will use Behavioural modelling

Functionality:
First, we will convert the .bmp file(of definite pixels) to a .hex file as Verilog cannot read images directly(using external software for the process). Then we will first take the .hex file as a 2-D array and will separate the RGB values. Then will use known algorithms for filters like grayscale, sepia, blur, etc. Other than that we will also crop the image as per input given from testbench. At last, converting the hex file back to BMP using external software yields the desired result.


Github link to the project: https://github.com/skhan-org/CS203_Project2021

**** Important Instructions ****

Requirements : Python 3.7 or above, ktinker and pillow library, verilog.

Ktinker and Pillow should either be pre-installed or should be installed through pip command.
The command prompt should be able to compile and run verilog files by the command (iverilog file.v, then vvp a.out).

How to run

* Clone the project into a seperate folder.
* cd into the project directory which contains main.py.
* Run main.py through python 3. (python3 main.py or python main.py)
* Follow the on screen instructions for processing the image.

Note :- Blur with option High can be too slow on some systems.
**Intermediate Submission:

* Added input module
* Added greyscale and Sepia
* Added crop module
* Input and Outputs specified for Blur
* BMP file converted to Hex

Tasks to be done:
* Completion of blur module
* Addition of testbench
* Output conversion directly to BMP.

**Final Submission:
* Added module for brightness control and blur
* Linked verilog files to python for better user Experience.
* Images are now automatically converted to hex and processed hex is now automatically saved back to image using python Pillow and tkinker module.
* Fixed some bugs.

Note :- Check the images section for sample output.

from PIL import Image
import os
dir=os.getcwd()
def hextoimg(width,height,location):
    f=open("./data/output.hex","r")
    newimg=Image.new("RGB",(width,height))
    for i in range(height):
        for j in range(width):
            a=int(f.readline(),16)
            b=int(f.readline(),16)
            c=int(f.readline(),16)
            newimg.putpixel((j,i),(a,b,c))
    newimg.save(location)
def imgtohex(location):
    f=open("./data/temp.hex","w+")
    im = Image.open(location, 'r')
    width, height = im.size
    pixel_values = list(im.getdata())
    for i in range(height):
        for j in range(width):
            f.write(hex(pixel_values[i*width+j][0])[2:])
            f.write('\n')
            f.write(hex(pixel_values[i*width+j][1])[2:])
            f.write('\n')
            f.write(hex(pixel_values[i*width+j][2])[2:])
            f.write('\n')
    f.close()
    f=open("./data/size.hex","w")
    f.write(hex(width)[2:]+"\n"+hex(height)[2:])
    f.close()
    return((width,height))
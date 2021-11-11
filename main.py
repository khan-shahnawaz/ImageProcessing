from python import conversions
import tkinter as tk
from tkinter import filedialog
import os
dir=os.getcwd()
def help():
    pass
def load():
    root = tk.Tk()
    root.withdraw()
    files = filedialog.askopenfilenames()
    width,height=conversions.imgtohex(files[0])
    try:
        width,height=conversions.imgtohex(files[0])
    except:
        print("Please Select valid file")
    print("Image Loaded Successfully")
    processMenu(width,height)
def processMenu(width,height):
    while 1:
        print("Select a filter")
        print("1. Grayscale")
        print("2. Sepia")
        print("3. Load New Image/Quit")
        choice = int(input())
        if (choice==1):
            command="iverilog greyscale.v"
            os.system(command)
            command="vvp a.out"
            os.system(command)
            root = tk.Tk()
            root.withdraw()
            files = filedialog.askopenfilenames()
            conversions.hextoimg(768,512,files[0])
        if choice==3:
            break
while (1):
    print("1. Load Image")
    print("2. Help")
    print("3. Quit")
    choice=int(input())
    if choice==3:
        break
    if choice==1:
        load()
    if choice==2:
        help()
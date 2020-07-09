import sys
import numpy
import cv2 as cv
from matplotlib import pyplot as plt

img=cv.imread('page.png',0)

#binary thresholding
ret,thresh1=cv.threshold(img,127,255,cv.THRESH_BINARY)

#cv.adaptiveThreshold (src, maxValue, adaptiveMethod, thresholdType, blockSize, C,dst)


#Adaptive Mean method
th2=cv.adaptiveThreshold(img,255,cv.ADAPTIVE_THRESH_MEAN_C,cv.THRESH_BINARY,81,10)
#adaptive gaussian method
th3=cv.adaptiveThreshold(img,255,cv.ADAPTIVE_THRESH_GAUSSIAN_C,cv.THRESH_BINARY,81,10)

titles = ['Original Image','BINARY','Adaptive_mean','Adaptive_Gaussian',]
images = [img,thresh1,th2,th3 ]
for i in range(4):
    plt.subplot(2,2,i+1),plt.imshow(images[i],'gray')
    plt.title(titles[i])
    plt.xticks([]),plt.yticks([])
plt.show()


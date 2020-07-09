import numpy as np
import cv2 as cv
from matplotlib import pyplot as plt

img = cv.imread('building.jpg',cv.IMREAD_GRAYSCALE)

#CV_64 is a 64 bit float no. which supports negative values induced by the gradient
#ksize is kernal size
lap=cv.Laplacian(img,cv.CV_64F,ksize=1)
#taking abslt value of lap and convert it into unsinged 8 bit
lap=np.uint8(np.absolute(lap))
sobelx=cv.Sobel(img,cv.CV_64F,1,0,ksize=1)
sobely=cv.Sobel(img,cv.CV_64F,0,1,ksize=1)
sobelx=np.uint8(np.absolute(sobelx))
sobely=np.uint8(np.absolute(sobely))
sobelCombined=cv.bitwise_or(sobelx,sobely)
#cv.Canny(src,threshold1,threshold2)
canny = cv.Canny(img,100,200)

titles = ['Original Image','Laplacian','sobelx','Sobely','SobelCombined','Canny']
images = [img, lap, sobelx, sobely, sobelCombined, canny]
for i in range(6):
    plt.subplot(2,3,i+1),plt.imshow(images[i],'gray')
    plt.title(titles[i])
    plt.xticks([]),plt.yticks([])
plt.show()
%distance  method

close all;
clc;
clear;
I=imread('cell.tif');
I1=imtophat(I,strel('disk',10));
%a very usfull morphological transformation to subtract the background from
%an image to the so called tophet,tophet is the subatraction of an opened
%image from the original. one can do opening in gray images removing all
%features samller than the structuring element
%basically removing the noise from the image lesser than the value 10;
%for histogram stretching 
I2=imadjust(I1); 
level=graythresh(I2);
bw=im2bw(I2,level);
c=~bw;
d=-bwdist(c);
%bwdist computes the distance transform ,the distance transform of a binary
%image is the distance from every pixel to the nearest non zero value pixel
d(c) = -Inf;
%modify the image so that the baground pixels and the extended maxima
%pixels are focused to be the only local minima in the image
L=watershed(d);
wi=label2rgb(L,'hot','w');
im=I;
im(L==0)=0;

subplot(3,3,3);
imshow(I2);
title('adjusted image');
subplot(3,3,8);
imshow(im);
title('final image showing ridge lines');
subplot(3,3,2);
imshow(I1);
title('tophat image');
subplot(3,3,1);
imshow(I);
title('original image');

subplot(3,3,5);
imshow(c);
title(' inverted image');
subplot(3,3,6);
imshow(L);
title('watershed image');
subplot(3,3,7);
imshow(wi);
title('hot color image');
subplot(3,3,4);
imshow(bw);
title('bw image');
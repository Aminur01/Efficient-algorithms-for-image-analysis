%edge detection
clc;
clear ;
close all;
I=imread('cameraman.tif');
subplot(2,2,1);
imshow(I);
title('RGB image');
%IG=rgb2gray(IRGB);
%___________sobel operator_______________%
b=edge(I,'sobel');
subplot(2,2,2);
imshow(b);
title('sobel');
%_____________prewitt____________________%
b=edge(I,'prewitt');
subplot(2,2,3);
imshow(b);
title('prewitt');
%_____________canny____________________%
b=edge(I,'canny');
subplot(2,2,4);
imshow(b);
title('canny');
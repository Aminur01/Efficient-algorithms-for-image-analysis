clc;
clear ;
close all;

IRGB=imread('ball.jpg');

%covert rgb to gray
IG=rgb2gray(IRGB);

%plot histogram
h=imhist(IG);
subplot(2,2,3);
plot(h);
title('Histogram');

%calculating threshold value
threshold=graythresh(IG);
threshold=threshold*255;

%creating matrix to implement threshold in image
[m,n]=size(IG);
thres= zeros(m,n);

for i=1:m
    for j=1:n
        if(IG(i,j)>threshold)
            thres(i,j)=1;
        else
            thres(i,j)=0;
        end
    end
end

%showing plots
subplot(2,2,1);
imshow(IRGB);
title('Original Image');
subplot(2,2,2);
imshow(IG);
title('Gray Image');
subplot(2,2,4);
imshow(thres);
title('Threshold image');

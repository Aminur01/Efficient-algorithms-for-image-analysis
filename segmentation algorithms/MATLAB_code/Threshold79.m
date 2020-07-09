clc;
clear ;
close all;

I=imread('D:\Internships\IITH\matlab/dog_smaple.jpg');
subplot(2,2,1);
imshow(I);
title('Dog sample');


%%histogram
h=imhist(I);
subplot(2,2,2);
plot(h);
title('Dog sample histogram');

%%histogram equilization
I2=histeq(I);
subplot(2,2,3);
imshow(I2);
title('equilized histogram')
subplot(2,2,4);
imhist(I2); 



 






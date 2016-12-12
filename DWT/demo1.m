close all;
clear all;
I=(imread('lena.jpg'));


y = mywavedec2(I,1);

% reconstruction
x = mywaverec2(y,1);

psnr0=psnr((I),uint8(x));
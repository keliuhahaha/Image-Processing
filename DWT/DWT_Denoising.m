clear;
clc;
X=imread('lena.jpg');

figure;
imshow(X);
title('Original Image');

X=double(X);
noise = 10*randn(size(X));
XX=X+noise; 
figure;
imshow(uint8(XX));
title('Image containing noise');

%% DWT
[LL,LH,HL,HH]=mydwt2(XX);
X1=myidwt2(LL,HL*0.2,LH*0.2,HH*0);
figure;
imshow(uint8(X1));

[LL,LH,HL,HH]=mydwt2(X1);
X2=myidwt2(LL,HL*0.2,LH*0.2,HH*0);
figure;
imshow(uint8(X2));

[LL,LH,HL,HH]=mydwt2(X2);
X3=myidwt2(LL,HL*0.2,LH*0.2,HH*0);
figure;
imshow(uint8(X3));

snr1 = (psnr( XX, noise));
snr2 = (psnr( X1, noise));
snr3 = (psnr( X2, noise));
snr4 = (psnr( X3, noise));




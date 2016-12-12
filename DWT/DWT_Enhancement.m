X=imread('pic17.jpg');
X=rgb2gray(X);

Hx = abs(fftshift(fft2(X)));
S1=20*log10(abs(Hx));
mx1 = max(abs(S1(:))); dB1 = S1 - mx1;
figure; 
mesh(dB1); 
title('|DFT(image1)|'); zlabel('dB');

figure;
subplot(1,2,1);imshow(X),title('Original Image')

[c,l]=wavedec2(X,2,'db5');
Csize=size(c);

for i=1:Csize(2)
        if(c(i)>300)
           c(i)=1.2*c(i);
        else
           c(i)=0.8*c(i);
        end
end

X1=waverec2(c,l,'db5');
X1=uint8(X1);
subplot(1,2,2);imshow(X1),title('Image after Enhancement')

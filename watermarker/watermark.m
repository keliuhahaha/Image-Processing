clear all;
clc;

figure;
input=imread('pic15.jpg');
imshow(input);
title('Original Image');

figure;
water=imread('A.jpg');
imshow(water,[]);
title('watermark');

input=double(input);
water=double(water);
inputr=input(:,:,1);
waterr=water(:,:,1);
inputg=input(:,:,2);
waterg=water(:,:,2);
inputb=double(input(:,:,3));
waterb=double(water(:,:,3));
r=0.06;
[Cwr,Swr]=wavedec2(waterr,1,'haar');
[Cr,Sr]=wavedec2(inputr,2,'haar');
Cr(1:size(Cwr,2)/16)=...
    Cr(1:size(Cwr,2)/16)+r*Cwr(1:size(Cwr,2)/16);
k=0;
while k<=size(Cr,2)/size(Cwr,2)-1
    Cr(1+size(Cr,2)/4+k*size(Cwr,2)/4:size(Cr,2)/4+...
        (k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/4+...
        k*size(Cwr,2)/4:size(Cr,2)/4+(k+1)*size(Cwr,2)/4+...
        r*Cwr(1+size(Cwr,2)/4:size(Cwr,2)/2));
    Cr(1+size(Cr,2)/2+k*size(Cwr,2)/4:size(Cr,2)/2+...
        (k+1)*size(Cwr,2)/4)=Cr(1+size(Cr,2)/2+...
        k*size(Cwr,2)/4:size(Cr,2)/2+(k+1)*size(Cwr,2)/4+...
        r*Cwr(1+size(Cwr,2)/2:3*size(Cwr,2)/4));
    Cr(1+3*size(Cr,2)/4+k*size(Cwr,2)/4:3*size(Cr,2)/4+...
        (k+1)*size(Cwr,2)/4)=Cr(1+3*size(Cr,2)/4+...
        k*size(Cwr,2)/4:3*size(Cr,2)/4+(k+1)*size(Cwr,2)/4+...
        r*Cwr(1+3*size(Cwr,2)/4:size(Cwr,2)));
    k=k+1;
end;
Cr(1:size(Cwr,2)/4)=Cr(1:size(Cwr,2)/4)+r*Cwr(1:size(Cwr,2)/4);
g=0.03;
[Cwg,Swg]=wavedec2(waterg,1,'haar');
[Cg,Sg]=wavedec2(inputg,2,'haar');
Cg(1:size(Cwg,2)/16)=...
    Cg(1:size(Cwg,2)/16)+g*Cwg(1:size(Cwg,2)/16);
k=0;
while k<=size(Cg,2)/size(Cwg,2)-1
    Cg(1+size(Cg,2)/4+k*size(Cwg,2)/4:size(Cg,2)/4+...
        (k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/4+...
        k*size(Cwg,2)/4:size(Cg,2)/4+(k+1)*size(Cwg,2)/4+...
        g*Cwg(1+size(Cwg,2)/4:size(Cwg,2)/2));
    Cg(1+size(Cg,2)/2+k*size(Cwg,2)/4:size(Cg,2)/2+...
        (k+1)*size(Cwg,2)/4)=Cg(1+size(Cg,2)/2+...
        k*size(Cwg,2)/4:size(Cg,2)/2+(k+1)*size(Cwg,2)/4+...
        g*Cwg(1+size(Cwg,2)/2:3*size(Cwg,2)/4));
    Cg(1+3*size(Cg,2)/4+k*size(Cwg,2)/4:3*size(Cg,2)/4+...
        (k+1)*size(Cwg,2)/4)=Cg(1+3*size(Cg,2)/4+...
        k*size(Cwg,2)/4:3*size(Cg,2)/4+(k+1)*size(Cwg,2)/4+...
        g*Cwg(1+3*size(Cwg,2)/4:size(Cwg,2)));
    k=k+1;
end;
Cg(1:size(Cwg,2)/4)=Cg(1:size(Cwg,2)/4)+g*Cwg(1:size(Cwg,2)/4);
b=0.12;
[Cwb,Swb]=wavedec2(waterb,1,'haar');
[Cb,Sb]=wavedec2(inputb,2,'haar');
Cb(1:size(Cwb,2)/16)=...
    Cb(1:size(Cwb,2)/16)+b*Cwb(1:size(Cwb,2)/16);
k=0;
while k<=size(Cb,2)/size(Cwb,2)-1
    Cb(1+size(Cb,2)/4+k*size(Cwb,2)/4:size(Cb,2)/4+...
        (k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/4+...
        k*size(Cwb,2)/4:size(Cb,2)/4+(k+1)*size(Cwb,2)/4+...
        b*Cwb(1+size(Cwb,2)/4:size(Cwb,2)/2));
    Cb(1+size(Cb,2)/2+k*size(Cwb,2)/4:size(Cb,2)/2+...
        (k+1)*size(Cwb,2)/4)=Cb(1+size(Cb,2)/2+...
        k*size(Cwb,2)/4:size(Cb,2)/2+(k+1)*size(Cwb,2)/4+...
        b*Cwb(1+size(Cwb,2)/2:3*size(Cwb,2)/4));
    Cb(1+3*size(Cb,2)/4+k*size(Cwb,2)/4:3*size(Cb,2)/4+...
        (k+1)*size(Cwb,2)/4)=Cb(1+3*size(Cb,2)/4+...
        k*size(Cwb,2)/4:3*size(Cb,2)/4+(k+1)*size(Cwb,2)/4+...
        b*Cwb(1+3*size(Cwb,2)/4:size(Cwb,2)));
    k=k+1;
end;
Cb(1:size(Cwb,2)/4)=Cb(1:size(Cwb,2)/4)+b*Cwb(1:size(Cwb,2)/4);
inputr=waverec2(Cr,Sr,'haar');
inputg=waverec2(Cg,Sg,'haar');
inputb=waverec2(Cb,Sb,'haar');
temp=size(inputr);
pic=zeros(temp(1),temp(2),3);
for i=1:temp(1);
    for j=1:temp(2);
        pic(i,j,1)=inputr(i,j);
        pic(i,j,2)=inputg(i,j);
        pic(i,j,3)=inputb(i,j);
    end;
end;
output=uint8(round(pic));
watermarked_image_uint8=uint8(output);
imwrite(watermarked_image_uint8,'watermarked1.bmp','bmp');

figure;
imshow(watermarked_image_uint8);
title('image added watermark');


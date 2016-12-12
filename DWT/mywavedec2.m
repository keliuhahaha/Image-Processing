function y=mywavedec2(x,dim)

x=modmat(x,dim);            

figure;imshow(x);title('Original Image');   
[m,n]=size(x);              
xd=double(x);               
for i=1:dim
    xd=modmat(xd,1);

[dLL,dHL,dLH,dHH]=mydwt2(xd);   

tmp=[dLL,dHL;dLH,dHH];          

xd=dLL;                         

[row,col]=size(tmp);            

y(1:row,1:col)=tmp;             
end

yd=uint8(y);            

for i=1:dim             
    m=m-mod(m,2);
    n=n-mod(n,2);
    yd(m/2,1:n)=255;
    yd(1:m,n/2)=255;
    m=m/2;n=n/2;
end
figure;imshow(yd);title('Wavelet Decomposited Image'); 

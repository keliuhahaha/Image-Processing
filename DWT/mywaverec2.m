function y=mywaverec2(x,dim)

xd=uint8(x);            

[m,n]=size(x);          

for i=1:dim             
m=m-mod(m,2);
n=n-mod(n,2);
xd(m/2,1:n)=255;
xd(1:m,n/2)=255;
m=m/2;n=n/2;
end
%figure;subplot(121);imshow(xd);title('Wavelets Decomposited Image'); 

xr=double(x);           

[row,col]=size(xr);    

for i=dim:-1:1    

tmp=xr(1:floor(row/2^(i-1)),1:floor(col/2^(i-1)));      

[rt1,ct1]=size(tmp);                         
rt=rt1-mod(rt1,2);ct=ct1-mod(ct1,2);

rLL=tmp(1:rt/2,1:ct/2);                    
rHL=tmp(1:rt/2,ct/2+1:ct);
rLH=tmp(rt/2+1:rt,1:ct/2);
rHH=tmp(rt/2+1:rt,ct/2+1:ct);

tmp(1:rt,1:ct)=myidwt2(rLL,rHL,rLH,rHH);              

xr(1:rt1,1:ct1)=tmp;       
end

y=xr;                   

yu=uint8(xr);            
figure; imshow(yu);title('Wavelets Reconstructed Image');

function [LL,HL,LH,HH]=mydwt2(x)
% input: x -- input matrix
% output: LL: approximation; LH: vertical detail; HL: horizontal detail;
% HH: diagnal detail

lpd=[1/2 1/2];hpd=[-1/2 1/2];           

[row,col]=size(x);                    
for j=1:row                             
    tmp1=x(j,:);
    [ca1,cd1]=mydwt(tmp1,lpd,hpd,1);
x(j,:)=[ca1,cd1];                   
end
for k=1:col                             
    tmp2=x(:,k);
    [ca2,cd2]=mydwt(tmp2,lpd,hpd,1);
x(:,k)=[ca2,cd2];                   
end
LL=x(1:row/2,1:col/2); 
LH=x(row/2+1:row,1:col/2);  
HL=x(1:row/2,col/2+1:col);   
HH=x(row/2+1:row,col/2+1:col);

end

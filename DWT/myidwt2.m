
function y=myidwt2(LL,HL,LH,HH)
% input: LL: approximation; LH: vertical detail; HL: horizontal detail;
% HH: diagnal detail
% output: y -- reconstruction matrix

lpr=[1 1];hpr=[1 -1];          
tmp_mat=[LL,HL;LH,HH];          
[row,col]=size(tmp_mat); 

for k=1:col                     
ca1=tmp_mat(1:row/2,k);     
    cd1=tmp_mat(row/2+1:row,k);
tmp1=myidwt(ca1,cd1,lpr,hpr);   
yt(:,k)=tmp1;                
end

for j=1:row                     
ca2=yt(j,1:col/2);           
    cd2=yt(j,col/2+1:col);
tmp2=myidwt(ca2,cd2,lpr,hpr);   
yt(j,:)=tmp2;                
end
y=yt; 

end

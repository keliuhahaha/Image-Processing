
function y = myidwt(cA,cD,lpr,hpr)
% function: inverse discrete wavelets transform
% input: cA -- low frquency signal
%        cD -- high frquency signal
%        lpd -- lowpass filter for reconstruction
%        hpd -- highpass filter for reconstruction
% output: y -- reconstruction signal 

lca=length(cA);             
lcd=length(cD);

while (lcd)>=(lca)          
    upl=upspl(cA);         
    cvl=conv(upl,lpr);     
    cD_up=cD(lcd-lca+1:lcd);   
    uph=upspl(cD_up);       
    cvh=conv(uph,hpr);      
    cA=cvl+cvh;             
    cD=cD(1:lcd-lca);       
    lca=length(cA);         
    lcd=length(cD);
end  

y=cA;   
end

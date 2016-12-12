
function [cA,cD] = mydwt(x,lpd,hpd,dim)
% function: 1D discrete wavelets decomposition of input x
% input: x -- input sequence
%        lpd -- lowpass filter
%        hpd -- highpass filter
%        dim -- wavelwet decompsition level
% output: cA -- low frquency signal
%         cD -- high frquency signal

cA=x;       
cD=[ ];

for i=1:dim
    cvl=conv(cA,lpd);   
    dnl=downspl(cvl);   
    cvh=conv(cA,hpd);   
    dnh=downspl(cvh);  
    cA=dnl;    
    cD=[cD,dnh]; 
end

end

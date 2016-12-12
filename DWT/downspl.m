function y=downspl(x)

N=length(x);        
M=floor(N/2);        
i=1:M;
y(i)=x(2*i); 

end
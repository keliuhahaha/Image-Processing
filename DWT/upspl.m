function y=upspl(x)
% function: upsampleing of the 1-D sequence x
%           e.g x = [x1, x2, x3] --> y = [x1, 0, x2, 0, x3];
% input: x -- sequence for upsampling
% output: y -- sequence after upsampling

N=length(x);        
M=2*N-1;

for i=1:M           
    if mod(i,2)
        y(i)=x((i+1)/2);
    else
        y(i)=0;
    end
end 

end

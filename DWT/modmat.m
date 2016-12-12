function y=modmat(x,dim)

[row,col]=size(x);         
rt=row - mod(row,2^dim);    
ct=col - mod(col,2^dim);    y=x(1:rt,1:ct);  
end

function [f]=isupper(i,maximum,point)

% new maximum ?
if(maximum(i)<point(i))
    f=true;
    return;
end

% new minimum ?
if(maximum(i)>point(i))
    f=false;
    return;
end

% equal, but other dimensions are upper?
for j=1:size(maximum,1)
    if(i~=j)
        if(maximum(j)<point(j))
            f=true;
            return;
        end
    end
end

f=false;

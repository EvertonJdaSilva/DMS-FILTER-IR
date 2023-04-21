function [f]=islower(i,minimum,point)

% new minimum ?
if(minimum(i)>point(i))
    f=true;
    return;
end

% new maximum ?
if(minimum(i)<point(i))
    f=false;
    return;
end

% equal, but other dimensions are lower?
for j=1:size(minimum,1)
    if(i~=j)
        if(minimum(j)>point(j))
            f=true;
            return;
        end
    end
end

f=false;

        
    
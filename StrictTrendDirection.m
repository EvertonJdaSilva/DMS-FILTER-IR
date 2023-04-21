function d = StrictTrendDirection(T,func_C,x)

g = feval(func_C,x);
j = (g>=0);
n = size(T,1);
I = eye(n);
s = zeros(n,1);
Taux = T(:,j);
for i=1:n
    if (sum(Taux(i,:) == -1)==0) && (sum(isnan(Taux(i,:)))==0) && (sum(T(i,:)~= 0)~=0)
        s(i) =  1;
    elseif (sum(Taux(i,:) == 1)==0) && (sum(isnan(Taux(i,:)))==0) && (sum(T(i,:)~= 0)~=0)
        s(i) = -1;
    else 
        s(i) = 0;
    end
end

d = sum(s.*I,2);
end
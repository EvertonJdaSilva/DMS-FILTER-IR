function TM = TrendMatrix(func_C,lbound,ubound)
p = 200;
n = length(lbound);
x = lhsdesign(n,p);
x = lbound+(ubound-lbound).*x;
m = length(feval(func_C,lbound));

gx = zeros(m,p);
for i=1:p
    gx(:,i) = feval(func_C,x(:,i));
end

TM = zeros(n,size(gx,1));
D  = eye(n);
delta = (ubound-lbound)/n;
for j=1:n
    di = D(:,j);
    deltai = delta(j);
    gy = zeros(m,p);
    for i=1:200
        gy(:,i) = feval(func_C,max(lbound,min(ubound,x(:,i)+deltai*di)));
    end
    G = gx-gy;
    indG1 = G>0;
    indG2 = G<0;
    indG3 = G==0;
    auxG1 = sum(indG1,2);
    auxG2 = sum(indG2,2);
    auxG3 = sum(indG3,2);

    for jj=1:m
        if auxG1(jj) == p
            TM(j,jj) = -1;
        elseif auxG2(jj) == p
            TM(j,jj) = 1;
        elseif auxG3(jj) == p
            TM(j,jj) = 0;
        else
            TM(j,jj) = NaN;
        end
    end
end
end
function f=barrier_fun(fun,x,g,h,l,u)
%% Barrier function for constrained problems
% min  fun=f(x)
% s.t. g(x)<=0
%      h(x)=0
%      l<=x<=u
% if we have not some constrained, set equal to 0!
%%
if nargin<3, g=[]; h=0; l=0; u=0; end
if nargin<4, h=0; l=0; u=0; end
n=length(x);
if isempty(g)
    g=@(x)0;
    geval=0;
else
    geval=feval(g,x);
end

if h==0
    h=@(x)0;
    heval=0;
else
    heval=feval(h,x);
end
y=[];
if (l==0 && u==0)
    s=n;
else
for i=1:n
    if (l(i)<=x(i) && x(i)<=u(i))
        s=1;
        y=[y,s];
    elseif (l(i)<=x(i) && u==0)
        s=1;
        y=[y,s];
    elseif (l==0 && x(i)<=u(i))
        s=1;
        y=[y,s];
    end
end
s=sum(y); 
end


if (geval<=0 && heval==0 && s==n)
    f=feval(fun,x);
else 
    f=inf;
end
end
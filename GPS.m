function [x,fx,iter,neval]=GPS(fun,x0,polling,g)
%% Generalized pattern search
%% inputs
% fun: the function that we want to minimize
% x0: initial guess
% D: spanning set - D=GZ where G is an invertible matrix and Z is a positive spanning set

%% Algorithm Parameters -- User choices
delta=1; % Initial step size
evalmax=5000; % maximum number of functions evaluations
tol=10^-5; % tolerace for delta update

%% Initialization
n=length(x0);
I=eye(n);% Identity matrix n by n
D=[I -I];% Coordinate search


iter=0;
P=x0+delta*D; % Initial poll set

fx=barrier_fun(fun,x0,g);
neval=1;
goon=1; x=x0;

while goon
    if polling==1
        % Complete strategies
        FT=[];
        for i=1:2*n
            ft=barrier_fun(fun,P(:,i),g);
            FT=[FT;ft];
        end
        neval=neval+2*n;
        [FT,ind]=min(FT);
        if FT>=fx
            delta=1/2*delta;
            P=x+delta*D;
            FT=[];
        else
            x=P(:,ind);
            P=x+delta*D;
            fx=FT; FT=[];
        end
    else
        % opportunistic strategies
        FT=barrier_fun(fun,P(:,1),g); i=1;
        goonaux=1; neval=neval+1;
        while FT >= fx && goonaux
            if i==2*n
                goonaux=0;
            else
                i=i+1;
            end
            FT=barrier_fun(fun,P(:,i),g);
            neval=neval+1;
        end
        if goonaux==0
            delta=1/2*delta;
            P=x+delta*D;
        else
            x=P(:,i);
            fx=FT;
            P=x+delta*D;
        end
    end
    if (delta<tol || neval>evalmax)
        goon=0;
    else
        iter=iter+1;
    end
end
end
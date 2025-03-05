function [F_IR,grad_IR] = func_IR(y,xk)

F_IR    = 0.5*norm(y-xk,2).^2;
grad_IR = y-xk;

end
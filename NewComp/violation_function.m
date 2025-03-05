function [c,ceq,gradc,gradceq] = violation_function(func_C,x,epsilon)
% violation function compute the violation of an infeasible point, if the
% point is feasible the violation value is equal to zero.
%
% Inputs: func_C: Name of the file defining the constaint
%         functions (for c_j, j = 1,...,p, function values).
%         grad_C: Name of the file defining constaint gradients
%         (for grad c_j, j = 1,...,p, gradient values).
%         x: vector (nx1)
%         epsilon_hx_curr: tolerance of inxact restoration
%         grad_aval: 0-1 variable, 1 if the constraints gradients are
%         avaiable, 0 otherwise.
%
%
% Output:
%
%    c, ceq, gradc, gradceq (nonlinear inequalities or equalities and
%                           the respective gradients evaluated at x).
h_aux   = feval(func_C,x);
% Compute nonlinear inequalities at x.
c       = norm(max(0,h_aux),2).^2-epsilon;
gradc   = [];

% Compute nonlinear equalities at x.
ceq     = [];
gradceq = [];
end
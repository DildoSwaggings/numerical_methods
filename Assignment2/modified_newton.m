function [calculated_zero, estimate_order_zero, vector_of_iterations] = modified_newton(fun, dfun, starting_point, precision, max_number_iterations, M)
%explanation:(...)
%
%
tol = precision
x = starting_point;
fx = feval(fun,x);
dfx = feval(dfun,x);
niter = 0; 
diff = abs(fx/dfx);
%calculate a meaning full value for M:

while diff >= tol & niter < max_number_iterations
   niter = niter + 1;      
   diff = - fx/dfx;
   x = x + M*diff;           
   diff = abs(diff);
   fx = feval(fun,x);
   dfx = feval(dfun,x);
end
if (niter==max_number_iterations & diff > tol)
    fprintf(['Newton stopped without converging to',...
    ' the desired tolerance because the maximum\n ',...
    'number of iterations was reached\n']);
end
calculated_zero = x
estimated_order_of_x = M
res = fx
end
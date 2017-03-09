function [zero,res,niter]=newton_complex(complex_number_1, complex_number_2, vector_discretization, max_number_iterations)
%NEWTON Finds function zeros.
% ZERO=NEWTON(FUN,DFUN,X0,TOL,NMAX) tries to find the
% zero ZERO of the continuous and differentiable
% function FUN nearest to X0 using the Newton method.
% FUN and its derivative DFUN accept real scalar input
% x and return a real scalar value. If the search
% fails an error message is displayed. FUN and DFUN
% can be either inline functions or anonymous
% functions or they can be defined by external m-files.
% ZERO=NEWTON(FUN,DFUN,X0,TOL,NMAX,P1,P2,...) passes
% parameters P1,P2,... to functions: FUN(X,P1,P2,...)
% and DFUN(X,P1,P2,...).
% [ZERO,RES,NITER]=NEWTON(FUN,...) returns the value of
% the residual in ZERO and the iteration number at
% which ZERO was computed.

%define non given optional input:
if exist('max_number_iterations')
else max_number_iterations = 10
end
%define function
fun = @(z) z.^3 + 1
dfun = @(z) 3.*z.^2
x = x0;
fx = feval(fun,x);
dfx = feval(dfun,x);
niter = 0; 
diff = abs(fx/dfx);
%make figure:
plot(real(complex_number_1),imag(complex_number_1),'.magenta')
set(gca, 'xlim', [0, 4.0])
set(gca, 'ylim', [0, 4.0])
xlabel('Re');  ylabel('Im'); 
hold on
plot(real(complex_number_2),imag(complex_number_2),'.green')
hold off
while diff >= tol & niter < nmax
   niter = niter + 1;      
   diff = - fx/dfx;
   x = x + M*diff;           
   diff = abs(diff);
   fx = feval(fun,x);
   dfx = feval(dfun,x);
end
if (niter==nmax & diff > tol)
    fprintf(['Newton stopped without converging to',...
    ' the desired tolerance because the maximum\n ',...
    'number of iterations was reached\n']);
end
zero = x; res = fx;
end

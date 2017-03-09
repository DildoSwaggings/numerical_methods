function x = newton_vector_output(fun,dfun,x0,tol,...
                                 nmax,varargin)
                             
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
x = zeros(nmax,1);
x(1) = x0;
fx = feval(fun,x(1),varargin{:});
dfx = feval(dfun,x(1),varargin{:});
niter = 0; diff = tol+1;
i=2;
while diff >= tol && niter < nmax
   niter = niter + 1;      
   diff = - fx/dfx;
   x(i) = x(i-1) + diff;           
   diff = abs(diff);
   fx = feval(fun,x(i),varargin{:});
   dfx = feval(dfun,x(i),varargin{:});
   i=i+1;
   x;
end
if (niter==nmax && diff > tol)
    fprintf(['Newton stopped without converging to',...
    ' the desired tolerance because the maximum\n ',...
    'number of iterations was reached\n']);
end
%deleting zero's at the end of x:
counter=0;
for j=1:nmax
    if x(j-counter) == 0
       x(j-counter) = [];
       counter = counter +1;
    end
end
%deleting repetition of numbers at end:
if x(length(x)) == x(length(x)-1)
    x(length(x)) = [];
end
x(length(x)) = [];
x
zero = x(length(x)); res = fx;
return
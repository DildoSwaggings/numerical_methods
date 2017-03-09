function p=order_of_convergence(x,alpha)
%function calculated order of convergence of iterative method for finding
%root of function. Input is x and alpha. Input x is a vector with all the
%elements of the chosen iterative mthod. This input can be gain by using a
%function. Input alpha is the 'real' solution for the root.
%Output is order of convergence p.
%
x_n_plus_1 = x(length(x));
x_n = x(length(x)-1);
x_n_min_1 = x(length(x)-2);

p = log((x_n_plus_1-alpha)/(x_n-alpha))/(log((x_n-alpha)/(x_n_min_1-alpha)))

end

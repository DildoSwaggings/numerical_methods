function [x] = secant(func, start1, start2, max_number_iterations, desired_precision)
%Secant takes a functionon R, two values for x start1 and start2 and a
%optional max number of iterations and desired precision. Function
%calculates iterative the root of function using secant: x_n = x_n-1  -
%f(x_n-1) * (x_n-1 - x_n-2)/(f(x_n-1)-f(x_n-2)
%
%Give values to optional input if not defined
%Max number of iterations = 21 by default
if exist('max_number_iterations')
else max_number_iterations = 21;
end
%measure for desired precision is max abs difference between x_n_plus_1 and x_n, default is 0.001
if exist('desired_precision')
else desired_precision = 0.0001;
end

%define vector for x of length max_number_iterations + 2 (for start values), with first two values given 
x = zeros(max_number_iterations + 2,1);
x(1) = start1;
x(2) = start2;


%Using while statement to iterate. Stops after max_number_iterations times, 
% or when desired prescision is archieved.
i = 3;
while i < max_number_iterations + 2
    if abs(func(x(i-1))-func(x(i-2))) > desired_precision
        x(i) = (x(i-1))-(x(i-1)-x(i-2))/(func(x(i-1))-func(x(i-2)))*func(x(i-1));
        last_i = i;
    else
        %last_value = x(i-1);
        last_i = i - 1;
        i = max_number_iterations + 2;
    end
    i = i + 1;
end
%deleting zero's and repetition of same numbers at the end of x:
counter=0;
last_i
for j=(last_i - 1):max_number_iterations + 2
    x(j-counter)=[];
    counter = counter +1;
end
%
%estimate the order of convergence:
%HELP: GETTING A COMPLEX NUMBER FOR secant(@(x) x^2-1,0,2,20,100,1)
%alpha = test_value_alpha;
%last_i = min(last_i,i);
%p = log((x(last_i)-alpha)/(x(last_i - 1)-alpha))/(log((x(last_i -1)-alpha)/(x(last_i -2)-alpha)))

%print last element of x (being the estimate for the root)
disp('This is the estimate for the root: ')
x(length(x))
end

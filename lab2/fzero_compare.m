fun = @(x)-x.^3 + 5*x; % function
x0 = 1.2; % initial point
z = fzero(fun,x0)
% lab4
eps = 0.0001;
a = 0.5;
n = 100;
h = 1/n;
A = zeros(n-1);
for i = 1:n-1
    A(i, i) = -(2*eps+h);
    if i ~= 1
        A(i-1, i) = eps+h;
        A(i, i-1) = eps;
    end
end
b = ones(n-1, 1);
b = b .* (a*h*h);
y_prec = A\b;
%calculate D L U
D = zeros(n-1);
L = zeros(n-1);
U = zeros(n-1);
for i = 1:n-1
    D(i, i) = A(i, i);
    if i ~= 1
        L(i, i-1) = -A(i, i-1);
        U(i-1, i) = -A(i-1, i);
    end
end
%iteration
y_jacobi = jacobi(D, L, U, b);
y_gaussseidel = gaussseidel(D, L, U, b);
w = 0.9;
y_sor = sor(D, L, U, b, w);
y_res1 = (y_jacobi-y_prec)./y_prec;
y_res2 = (y_gaussseidel-y_prec)./y_prec;
y_res3 = (y_sor-y_prec)./y_prec;
norm(y_res1, Inf)
norm(y_res2, Inf)
norm(y_res3, Inf)
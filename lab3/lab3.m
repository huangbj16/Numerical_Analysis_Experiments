%�������ϻ���6
%(1)
n = 10;
H = hilb(n);
x = ones([n,1])
b = H * x
L = cholesky_factorization(H)
L*L'
Y = L\b;
X = L'\Y
r = b-H*X
delta_x = X-x
r_norm = norm(r, Inf)
delta_x_norm = norm(delta_x, Inf)

'(2)'
%(2)
%����һ��10-7�Ŷ���
b(1) = b(1)+1e-7;
Y = L\b;
X = L'\Y
r = b-H*X
delta_x = X-x
r_norm = norm(r, Inf)
delta_x_norm = norm(delta_x, Inf)
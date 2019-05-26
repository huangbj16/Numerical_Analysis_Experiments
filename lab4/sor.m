function [x] = sor(D, L, U, b, w)
%JACOBI 此处显示有关此函数的摘要
%   此处显示详细说明
    [n,n] = size(D);
    x_prev = zeros(n, 1);
    x_next = ones(n, 1);
    w_inv = 1/w;
    while norm((x_prev-x_next)./x_prev, Inf) >= 1e-4
        x_prev = x_next;
        x_next = (D.*w_inv-L)\((w_inv-1).*D+U)*x_prev+(D.*w_inv-L)\b;
    end
    x = x_next;
end



function [x] = gaussseidel(D, L, U, b)
%JACOBI �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    [n,n] = size(D);
    x_prev = zeros(n, 1);
    x_next = ones(n, 1);
    while norm((x_prev-x_next)./x_prev, Inf) >= 1e-4
        x_prev = x_next;
        x_next = (D-L)\U*x_prev+(D-L)\b;
    end
    x = x_next;
end



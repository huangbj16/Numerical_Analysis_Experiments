i = 1;
prev = -1;
next = 0;
while prev ~= next
    prev = next;
    next = next + single(1/i);
    i = i+1;
end
single_res = next;
end_i = i;
%单精度下，n=2097153时，求和结果不再变化。

i = 1;
prev = -1;
next = 0;
while prev ~= next
    prev = next;
    next = next + double(1/i);
    i = i+1;
    if mod(i, 10000000) == 0
        i, next
    end
end
double_res = next;

relative_error = (single_res - double_res)/double_res;
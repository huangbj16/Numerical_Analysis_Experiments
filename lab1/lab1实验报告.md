# lab1实验报告

计63 黄冰鉴 2016011296

2019/5/6

---

### 第1题

绘制代码如下，

```matlab
M = 1;
epsilon = 10^(-16);
x = logspace(-16, 0, 10000);
y = x ./ 2 + (2*epsilon) ./ x;
z = x ./ 2;
w = (2*epsilon) ./ x;
loglog(x, y,'-', x, z,':', x, w,':');
```

![](D:\2019spring\数值分析\Numerical_Analysis_Experiments\lab1\t1.png)



步长增加时，截断误差逐渐增大，舍入误差逐渐减小。在10^(-8)附近，总误差达到最小值。



### 第3题

实现代码如下，

```matlab
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
    if i == end_i
        break
    end
end
double_res = next;

relative_error = (single_res - double_res)/double_res;
```

(1)
$$
单精度下，n=2097153时，求和结果不再变化。\\
理论上，由定理1.6，若\left | \frac{x2}{x1} \right| ≤ \frac{1}{2}\epsilon_{mach}，则做相加操作时，结果不受影响。\\
代入\epsilon_{mach}=5.96*10^{-8}，x1 = 15.4037，\\
可得n = \frac{1}{x2} = 2178505，和实际值比较接近。
$$
(2)
$$
双精度下，n=2097153时，求和结果result_{double} = 15.1333.\\
由(1)可知，result_{single} = 15.4037,\\
所以相对误差Error_{relative} = 0.0179
$$
(3)
$$
若使用双精度浮点数，\\
n = \frac{1}{x2} = \frac{2}{\epsilon_{mach}*x1}，\\
其中\epsilon_{mach}=1.11*10^(-16)。\\
因为\sum_{n=1}^{\infty}\frac{1}{n}不收敛，所以只能估算。\\
当n = 10^9时，sum = 21.3005。\\
不妨设放大sum为sum = 21.3005*n/10^9。\\
所以\frac{21.3005*n^2}{10^9} = \frac{2}{\epsilon_{mach}}。\\
可得，n至少为9.2*10^{11}。\\
假设计算机每秒计算10^8，则至少需要9200s，即3小时左右。
$$





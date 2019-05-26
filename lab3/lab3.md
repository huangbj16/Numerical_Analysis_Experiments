# lab3 实验报告

计63 黄冰鉴 2016011296

2019/5/25

---

第三章上机题6

### 解题思路

首先手动实现了cholesky分解，代码如下，

```matlab
function [u] = cholesky_factorization( A )
    if A~=A'
        error('Invalid Argument')
    end
    [n,n] = size(A);
    for j = 1:n
        for k = 1:j-1
            A(j,j) = A(j,j)-A(j,k)*A(j,k);
        end
        A(j,j) = sqrt(A(j,j));
        for i = j+1:n
            for k = 1:j-1
                A(i,j) = A(i,j)-A(i,k)*A(j,k);
            end
            A(i,j) = A(i,j)/A(j,j);
        end
    end
    %clear upper triangle
    for i = 1:n
        for j = i+1:n
            A(i,j) = 0;
        end
    end
    u = A;
end
```

然后依次完成了三个小问。
$$
(1)
n = 10时，
残差r的无穷范数\Vert{r}\Vert_{\infty} = 4.4409*10^{-16}，\\
误差\Delta x的无穷范数\Vert{\Delta x}\Vert_\infty = 4.0521*10^{-4}。\\
(2)
给b增加一个10^{-7}的扰动项之后，残差r的无穷范数\Vert{r}\Vert_{\infty} = 2.2204*10^{-16}，\\
误差\Delta x的无穷范数\Vert{\Delta x}\Vert_\infty = 0.9603。\\
观察发现，残差因为扰动项的影响并不大，但是解的误差影响非常大。\\
$$
(3)

| n      | r_norm        | delta_x_norm | r_norm(with deviation) | delta_x_norm(with deviation) |
| ------ | ------------- | ------------ | ---------------------- | ---------------------------- |
| n = 8  | 4.4409e-16    | 7.0128e-07   | 4.4409e-16             | 0.0288                       |
| n = 10 | 4.4409*10^-16 | 4.0521*10^-4 | 2.2204*10^-16          | 0.9603                       |
| n = 12 | 4.4409e-16    | 0.0553       | 4.4409e-16             | 30.9951                      |

观察可以发现，

残差r受到n和扰动的影响非常小，几乎没有变化，非常稳定；

而解的误差delta_x受到n和扰动的影响非常大，n增加时，解的误差逐渐增加，并且扰动对解的影响也增大。

这个实验验证了课本中对希尔伯特矩阵病态性的描述。

随着阶数增加，希尔伯特矩阵的条件数增加非常快。因此当阶数非常大时，一点点扰动就会无限放大误差。


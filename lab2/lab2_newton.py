
def f(x):
    # return x*x*x-x-1
    return -pow(x, 3)+5*x

def f_fdev(x):
    # return (x*x*x-x-1)/(3*x*x-1)
    return (-pow(x, 3)+5*x)/(-3*x*x+5)

lda_0 = 0.5
x_prev = 0
y_prev = f(x_prev)
# x_next = 0.6
x_next = 1.2
y_next = f(x_next)
thres1 = 1e-8
thres2 = 1e-8

while abs(y_next) > thres1 or abs(x_next-x_prev) > thres2:
    y_prev = y_next
    x_prev = x_next
    s = f_fdev(x_prev)
    x_next = x_prev - s
    lda = lda_0
    while abs(f(x_next)) >= abs(f(x_prev)):
        x_next = x_prev - lda*s
        lda = lda/2
    y_next = f(x_next)
    print('final λ = %.8f'%(lda*2), 'approx x = ', x_next, 'approx f(x) = ', y_next)

print(x_next, f(x_next))
% x = linspace(-10,10,200);
% y = cos(x);
% plot(x,y)

M = 1;
epsilon = 10^(-16);
x = logspace(-16, 0, 100);
y = x ./ 2 + (2*epsilon) ./ x;
z = x ./ 2;
w = (2*epsilon) ./ x;
t = abs((sin(1 + x) - sin(1)) ./ x - cos(1)); 
loglog(x, y,'-', x, z,':', x, w,':', x, t, '-');
axis([-inf inf -inf inf])

saveas(gcf,'Barchart.png')
% x = linspace(-10,10,200);
% y = cos(x);
% plot(x,y)

M = 1;
epsilon = 10^(-16);
x = logspace(-16, 0, 10000);
y = x ./ 2 + (2*epsilon) ./ x;
z = x ./ 2;
w = (2*epsilon) ./ x;
loglog(x, y,'-', x, z,':', x, w,':');

saveas(gcf,'Barchart.png')
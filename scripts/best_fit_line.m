%best fit line
xp = 1:10;
yp = xp + rand(1,10)*10

%calculating best fit line
p = polyfit(xp, yp,1);
yFit = @(x) p(1).*x + p(2);
ezplot(yFit, 0, 10);
hold on;
scatter(xp,yp);
hold off;

%r^2
%y residual
yResid = yp - yFit(1:10)
%sum of squares of the residual
SSResid = sum(yResid.^2)
%sum of squares total
SSTotal = length(y-1) * var(y)
%r^2
rsq = 1- SSResid / SSTotal
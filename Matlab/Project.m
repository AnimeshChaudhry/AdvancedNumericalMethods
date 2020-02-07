a = 0;
b = 10;
N = 100;
h = (b-a)/N;
x = a:h:b;
F = @(t,y) [y(2); -y(2)-y(1)];
[~,y1] = RKO4(F, a, b, N, [0;5*cos(t)]);

plot(x,y1(1,:));
hold off;

legend('Current') %Legend with our functions (they will look pretty on the graph)
title('Current vs. Time')
xlabel('t (seconds) ---->') % x-axis label
ylabel('I (Amps) ---->') % y-axis label
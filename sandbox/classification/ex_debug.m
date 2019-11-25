close all; clc;

plot(x(:,2), y, 'rx');

hold on;

disp(computeCostMulti(x, y, [history(2,2); history(2, 3)]));

plot(x(:,2), x*[history(2,2); history(2, 3)], '-');
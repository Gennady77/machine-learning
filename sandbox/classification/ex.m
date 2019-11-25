clear ; close all; clc;

x = [0.5;1;2;2.5;3.5;4;5;6;20];
y = [0;0;0;0;1;1;1;1;1];

x = [ones(length(y), 1), x];

plot(x(:, 2),y, 'rx');

theta = zeros(2,1);

[theta, history] = gradientDescentMulti(x, y, theta, 1, 10000);

#hold on;

#plot(x(:,2), hipothesisFunction(x, theta), '-');

plot(1:numel(history), history, '-b', 'LineWidth', 2);


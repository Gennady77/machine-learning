clear ; close all; clc;

x = [-5: 0.1: 5];
y = [-5: 0.1: 5];
x = x(randperm(length(x)));
y = y(randperm(length(y)));

d = [2 0; 0 1];
Q = [sqrt(0.5) -sqrt(0.5); sqrt(0.5) sqrt(0.5)];
X = [x',y'];

dd = Q * d * Q';

X = X * dd;

plot(X(:,1), X(:,2), 'rx');

axis("square", "equal");
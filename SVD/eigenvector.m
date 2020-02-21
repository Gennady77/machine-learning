clear ; close all; clc;

x1 = [1;2];
x2 = [4;1];
x3 = -2*x1 + 3*x2;

X = [x1';x2';x3'];

plot(X(:,1), X(:,2), 'rx');

axis("square", "equal");
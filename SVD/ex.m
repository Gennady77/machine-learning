clear ; close all; clc;

V = [12;7];

v = [V(1,1)/norm(V);V(2,1)/norm(V)];
X = [2 3; 4 6; 6 2; 7 5];
A = X' * X;

Xv = X * v;
a = Xv'*Xv;

ma = v' * A * v;

plot(X(:,1), X(:,2), 'rx');

hold on;

plot([0;V(1,1)], [0;V(2,1)], '-');
plot([0;v(1,1)], [0;v(2,1)], '-', 'color', 'r', 'linewidth', 4);

hold off;

Q = [1/sqrt(2), -1/sqrt(2); 1/sqrt(2), 1/sqrt(2)];
D = [2 0; 0 1];

plot([0;Q(1,1)], [0;Q(1,2)], '-');

hold on;

plot([0;Q(2,1)], [0;Q(2,2)], '-', 'color', 'r');
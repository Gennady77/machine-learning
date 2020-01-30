clear ; close all; clc;

x = [3: 12];
y = 2*x .+ randi(10, 1, 10)*2;


x_mean = x - mean(x);
y_mean = y - mean(y);

X = [x_mean', y_mean']

k = 1;

a1_f = [2;3];
a1_n = [2/norm(a1_f);3/norm(a1_f)];

as = a1_n*(X*a1_n);

plot(X(:,1), X(:,2), 'rx');

axis("square", "equal");

hold on;
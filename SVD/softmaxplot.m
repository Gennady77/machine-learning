clear ; close all; clc;

#plot([0, 0], [-3, 5], 'b-', [7, -5], [0, 0], 'b-');

#hold on;

X = [-3:0.1:2];
Q = -0.5;

plot(X, exp(Q*X), "r-");

axis("square", "equal");
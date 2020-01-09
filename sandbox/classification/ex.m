clear ; close all; clc;

x = [0.5;1;2;2.5;3.5;4;5;6;20];
y = [0;0;0;0;1;1;1;1;1];

X = [ones(length(y), 1), x];

plot(X(:, 2),y, 'rx');

theta = zeros(2,1);

[theta] = trainLinearReg(X, y, 0);




clear ; close all; clc;

binary_digits = false;
num_classes = 10;

[train,test] = ex1_load_mnist(binary_digits);

train.X = [ones(1, size(train.X, 2)); train.X];
test.X = [ones(1, size(test.X, 2)); test.X];
train.y = train.y+1;
test.y = test.y+1;

m = size(train.X, 2); %number exaples
n = size(train.X, 1); %number features

initial_theta = rand(n,num_classes-1)*0.001;

tic;

options = struct('GradObj', 'on','MaxIter', 200);

costFunction = @(t) softmax_regression_vec(t, train.X, train.y);

theta(:) = fmincg(costFunction, initial_theta, options);

fprintf('Optimization took %f seconds.\n', toc);
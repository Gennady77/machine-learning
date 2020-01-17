clear ; close all; clc;

data = csvread('diabetes.csv');
data = data(2:length(data),:);

X = data(:, 1:8);
y = data(:, 9);

negative_count = sum(data(:, 9)==0);
positive_count = sum(data(:, 9)==1);
target_ratio = positive_count/negative_count;

[X_train, y_train, X_test, y_test] = splitTestData(X, y, 0.2);

[x_train, mu, sigma] = featureNormalize(x_train);
X_train = [ones(size(x_train,1), 1), x_train];


theta = trainLogicReg(X_train, y_train, 0);

[x_test, mu, sigma] = featureNormalize(x_test);
X_test = [ones(size(x_test,1), 1), x_test];

p = predict(theta, X_test);

mean(double(p == y_test))
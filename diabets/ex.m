clear ; close all; clc;

load "data.mat";

ratio = 0.2;
m = length(data);
test_count = round(m * ratio);
data_test = data(1:test_count, :);
X_test = data_test(:, 1:8);
y_test = data_test(:, 9);

X = X_test;
y = y_test;

p = zeros(5, 1);
poly = 1;

for i = 1:5
[X_train, y_train, X_val, y_val] = splitTestData(X, y, 0.2, i);

X_train = polyFeatures(X_train,poly);
[X_train, mu, sigma] = featureNormalize(X_train);

theta = trainLogicReg(X_train, y_train, 0);

X_val = polyFeatures(X_val,poly);
X_val = bsxfun(@minus, X_val, mu);
X_val = bsxfun(@rdivide, X_val, sigma);

pr = predict(theta, X_val);

p(i) = mean(double(pr == y_val));
endfor

mean(p)
clear ; close all; clc;

load "data.mat";

ratio = 0.2;
m = length(data);
test_count = round(m * ratio);
data_test = data(1:test_count, :);
data_train = data((test_count+1) : length(data), :);
X_test = data_test(:, 1:8);
y_test = data_test(:, 9);

X = data_train(:, 1:8);
y = data_train(:, 9);

p = crossValidationTrain(X, y, 1);
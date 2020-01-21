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

#p = crossValidationTrain(X, y, 1, 0)

[X_train, y_train, X_val, y_val] = splitTestData(X, y, 0.2, 1);

[X_train, mu, sigma] = featureNormalize(X_train);
X_val = bsxfun(@minus, X_val, mu);
X_val = bsxfun(@rdivide, X_val, sigma);

[lambda_vec, error_train, error_val] = validationCurve(X_train, y_train, X_val, y_val);

plot(lambda_vec, error_train, lambda_vec, error_val);
legend('Train', 'Cross Validation');
xlabel('lambda');
ylabel('Error');

#p = crossValidationTrain(X, y, 1, 3)
function [X_train, y_train, X_test, y_test] = splitTestData(X, y, ratio)

data_negative = X(y==0, :);
data_positive = X(y==1, :);

positive_test_count = round(length(data_positive) * ratio);
negative_test_count = round(length(data_negative) * ratio);

m_neg = length(data_negative);
rndIDX = randperm(m_neg);
data_test_negative = data_negative(rndIDX(1:negative_test_count), :);
data_train_negative = data_negative(rndIDX(negative_test_count+1:m_neg), :);

m_pos = length(data_positive);
rndIDX = randperm(m_pos);
data_test_positive = data_positive(rndIDX(1:positive_test_count), :);
data_train_positive = data_positive(rndIDX(positive_test_count+1:m_pos), :);

x_train = [data_train_positive; data_train_negative];
x_test = [data_test_positive; data_test_negative];
y_train = x_train(:, 9);
y_test = x_test(:, 9);

x_train = x_train(:, 1:8);
x_test = x_test(:, 1:8);
function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

#{
c_vals = [1;2;5;10;20;40;70;100];
sigma_vals = [0.01;0.03;0.1;0.3;1;3;10;30];
error = zeros(length(c_vals), length(sigma_vals));

for i = 1:length(c_vals)
  for j = 1:length(sigma_vals)
    C_train = c_vals(i);
    sigma_train = sigma_vals(j);
    
    model = svmTrain(X, y, C_train, @(x1, x2) gaussianKernel(x1, x2, sigma_train));
    predictions = svmPredict(model, Xval);
    error(i,j) = mean(double(predictions ~= yval));
  endfor
endfor

disp(error);

[v, min_row] = min(min(error,[],2));
[v, min_col] = min(min(error,[],1));

C = c_vals(min_row);
sigma = sigma_vals(min_col);
#}

% =========================================================================

end

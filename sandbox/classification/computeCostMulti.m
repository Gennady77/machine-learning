function [J, grad] = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

summ = 0;

for i = 1:m
  x = X(i,:);
  z = x * theta;
  h = sigmoid(z);
  #summ = summ + (h - y(i))**2;
  
  if y(i) == 0
    cost = -log(1-h);
  elseif y(i) == 1
    cost = -log(h);
  endif
  
  summ = summ + cost;
endfor

J = summ/m;

for j = 1:size(theta)
  sunGrad = 0;
  for i = 1:m
    x = X(i,:);
    z = x * theta;
    h = sigmoid(z);
    
    sunGrad = sunGrad + (h - y(i)) * x(j);
  endfor
  
  grad(j) = sunGrad / m;
  
endfor


% =========================================================================

end

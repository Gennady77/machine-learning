function [theta, history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
history = zeros(num_iters, 1);
temp = zeros(size(theta), 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCostMulti) and gradient here.
    %


    n = size(X, 2);
    
    for j = 1:n
    
      hSum = 0;
      
      for i = 1:m
      
        x = X(i,:);
        
        h = hipothesisFunction(x, theta);
        
        sSum = (h - y(i)) * x(j);
        
        hSum = hSum + sSum;
        
      endfor
      
      derTheta = 1/m * hSum;
      
      if j == 2
        disp(derTheta);
      endif

      temp(j) = theta(j) - alpha * derTheta;
      
    endfor

    theta = temp;


    % ============================================================

    % Save the cost J in every iteration    
    history(iter) = computeCostMulti(X, y, theta);

end

end

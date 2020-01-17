function [theta] = trainLogicReg(X, y, lambda)

% Initialize Theta
initial_theta = zeros(size(X, 2), 1); 

% Create "short hand" for the cost function to be minimized
costFunction = @(t) lrCostFunction(t, X, y, lambda);

% Now, costFunction is a function that takes in only one argument
options = optimset('GradObj', 'on', 'MaxIter', 50);

% Minimize using fmincg
theta = fmincg(costFunction, initial_theta, options);

end
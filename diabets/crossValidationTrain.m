function [prediction] = crossValidationTrain(X, y, poly)
  ratio = 0.2;
  p = zeros(5, 1);
  
  for i = 1:5
    [X_train, y_train, X_val, y_val] = splitTestData(X, y, ratio, i);

    X_train = polyFeatures(X_train,poly);
    [X_train, mu, sigma] = featureNormalize(X_train);

    theta = trainLogicReg(X_train, y_train, 0);

    X_val = polyFeatures(X_val,poly);
    X_val = bsxfun(@minus, X_val, mu);
    X_val = bsxfun(@rdivide, X_val, sigma);

    pr = predict(theta, X_val);

    p(i) = mean(double(pr == y_val));
  endfor
  
  prediction = mean(p);
endfunction

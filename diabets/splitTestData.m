function [X_train, y_train, X_val, y_val] = splitTestData(X, y, ratio, nn)

  m = length(X);
  count = round(m * ratio);
  
  offset = (nn - 1) * count;
  start = offset + 1;
  finish = offset + count;
  
  if finish > m
    finish = m;
  endif

  X_val = X(start:finish, :);
  X(start:finish, :) = [];
  X_train = X;
  
  y_val = y(start:finish, :);
  y(start:finish, :) = [];
  y_train = y;
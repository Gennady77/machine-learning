function h = hipothesisFunction(x, theta)
  z = x*theta;
  
  h = 1/(1 + exp(-z));
end
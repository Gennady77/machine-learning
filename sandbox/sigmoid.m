clear ; close all; clc;

x = [-10:10];
theta = [1];

h = exp(theta'*x)./(1+exp(theta'*x));

plot(x, h);

K = 2;
theta2 = [1, 1];

summ = 0;
for j = 1:K
  summ = summ + exp(theta2(1,j)' * x);
endfor

exp_m = [exp(theta2(:,1)'*x); exp(theta2(:,2)'*x)];
h2 = (1./summ).*exp_m;
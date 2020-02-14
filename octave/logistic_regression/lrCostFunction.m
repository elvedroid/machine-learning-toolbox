function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

reg_theta = ones(size(theta));
reg_theta(1) = 0;
h = sigmoid(X* theta);
J = (1/m) * sum(-y .* log(h) - (1 - y) .* log(1 - h)) + (lambda/(2*m)) * sum(theta(2:end).^2);

grad = (1/m) * sum((h - y) .* X);
grad = grad' + reg_theta * (lambda/m).*theta;
grad = grad(:);

end

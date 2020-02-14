function [theta] = normalEqnReg(X, y, lambda)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

X_temp 			= X' * X;
reg_matrix 		= (eye(size(X_temp)));
reg_matrix(1,1) = 0;
theta 			= pinv(X_temp + lambda * reg_matrix) * X' * y;

end

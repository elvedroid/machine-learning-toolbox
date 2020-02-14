function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% We need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

X = [ones(m,1), X];

z_2 =  X * Theta1'; 
a_2 = sigmoid(z_2);
a_2 = [ones(m, 1), a_2];

z_3 = a_2 * Theta2';
h = sigmoid(z_3);

y = y == 1:num_labels;

J = (1/m) * sum(sum(-y .* log(h) - (1 - y) .* log(1 - h))) + (lambda/(2*m)) * (sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));

delta1 = zeros(size(Theta1));
delta2 = zeros(size(Theta2));

for i = 1:m
	a = X(i, :);
	z2 = a*Theta1';
	a2 = [1, sigmoid(z2)];
	a3 = sigmoid(a2 * Theta2');
	d3 = a3 - y(i, :);
	sg = [1, sigmoidGradient(z2)];
	d2 = d3*Theta2 .* sg;
	delta2 = delta2 + d3' * a2;
	d2 = d2(2:end);
	delta1 = delta1 + d2' * a;
end

Theta1_grad = (1/m) * delta1;
Theta2_grad = (1/m) * delta2;
Theta1_grad(:, 2:end) = Theta1_grad(:, 2:end) + (lambda/m) * Theta1(:, 2:end);
Theta2_grad(:, 2:end) = Theta2_grad(:, 2:end) + (lambda/m) * Theta2(:, 2:end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];

end

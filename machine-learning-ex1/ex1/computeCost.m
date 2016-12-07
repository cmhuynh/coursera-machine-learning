function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% from the lecture, our hypothesis / prediction function is
% product of theta multiples with X
%
% X is a matrix mx2, with padding of 1 and one feature, where m is size of data set
% since theta is presented as a vector 2xm
% to multiple theta to X, we need to transpose both theta and X, to the dimension of 1x2 and 2xm
% and transpose the result to verctor mx1
% 
% a shorthand is to do X * theta, or (mx2) * (2x1), to produce the result vector	
	
predictions = X * theta;
sqrErrors = (predictions - y) .^ 2;
J = 1/(2 * m) * sum(sqrErrors);


% =========================================================================

end

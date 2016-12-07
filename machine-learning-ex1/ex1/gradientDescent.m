function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %



	% inspired by te Vectorization lecture
	% and try to apply into each calculation of each theta 0, 1, ...
	%
	% for each theta (0), first to calucate the prediction - y, which is a vector of mx1, m is size of data set
	% then for each value of the result vector, multiply with the vector X(:,0) of size mx1
	% index 0 of X is corresponding to theta (0), similar to 1, 2, ... n
	% then sum it up across the data set
	%
	% verctor error mx1 and X mx2, and similar to the job in computeCost, its a product of transpose (X) * error, or 2xm * mx1, result in 2*1
	% of which average of, multiply with learning rate alpha, is the delta for each iteration of theta
	% sanity check with octave
	% say vector error is [1; 2; 3] and X is [1, 1; 1, 2; 1, 3]
	% to calculate for theta 0, pick column 0 of X on all data set (size 3 here), so its 1*1 + 2*1 + 3*1
	% and similarly for theta 1, its 1*1 + 2*2 + 3*3
	% vectorization: transpose(X) * error
		
	error = (X * theta) - y;
	delta = X' * error;
	theta = theta - (alpha/m) * delta;


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end

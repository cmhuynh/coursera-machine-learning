function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_range = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';
sigma_range = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]';
errors = zeros(size(C_range, 1), size(sigma_range, 1));
	
for r = 1:size(sigma_range, 1)
	for c = 1:size(C_range, 1)
		model = svmTrain(X, y, C_range(c), @(x1, x2) gaussianKernel(x1, x2, sigma_range(r)));
		predictions = svmPredict(model, Xval);
		errors(r, c) = mean(double(predictions ~= yval));
	endfor		
endfor	

		
[r, c] = find(errors == min(errors(:)));
sigma = sigma_range(r);
C = C_range(c);


% =========================================================================

end

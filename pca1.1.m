% Put data in X
X = randi(10,10,10);

% Center data
mean_X = mean(X);
X = X - mean_X;

% Covariance matrix
cov_X = (X' * X) / (size(X, 1) - 1);

% Eigenvector (V) and eigenvalues (D)
[V, D] = eig(cov_X);

% Descending sort eigenvectors eigenvalues 
[~, idx] = sort(diag(D), 'descend');
V = V(:, idx);

% Project the data onto the principal components
Z = X * V;
disp(Z);

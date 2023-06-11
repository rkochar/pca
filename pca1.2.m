% Put data in X
X = randi(10, 10, 10)

% Center the data by subtracting the mean from each feature
mean_X = mean(X);
X = X - mean_X;

% Compute Gram matrix, eigenvectors (V) and eigenvalues (D) 
K = X * X';
[V, D] = eig(K);

% Descending sort the eigenvectors by eigenvalues 
[~, idx] = sort(diag(D), 'descend');
V = V(:, idx);

% Project the data onto the principal components
Z = X' * V;
disp(Z);

% Put data in X
X = randi(10, 10, 10)

% Set the number of snapshots
numSnapshots = 3

% Select random snapshots
snapshotIndices = randperm(size(X, 1), numSnapshots);
snapshots = X(snapshotIndices, :);

% Center the snapshots
meanSnapshots = mean(snapshots);
snapshots = snapshots - meanSnapshots;

% Compute covariance matrix of the snapshots
covSnapshots = (snapshots' * snapshots) / (size(snapshots, 1) - 1);

% Compute eigenvectors (V) and eigenvalues (D)
[V, D] = eig(covSnapshots);

% Descending sort the eigenvectors by eigenvalues
[~, idx] = sort(diag(D), 'descend');
V = V(:, idx);

% Project the original data onto the principal components
X_centered = X - meanSnapshots;
reducedData = X_centered * V;
disp(reducedData);

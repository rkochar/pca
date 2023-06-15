kernel
sampleIndices = randperm(size(X, 1), numSamples);
samples = X(sampleIndices, :);
kernelMatrix = samples * samples';

% Compute eigenvectors (U) and eigenvalues (V)
[U, V] = eig(kernelMatrix);

% Descending sort eigenvectors based on eigenvalues
[~, idx] = sort(diag(V), 'descend');
U = U(:, idx);

% Compute projection and normalize with scaling factors
projectionMatrix = samples' * U;
scalingFactors = sqrt(diag(V(1:numEigenvectors, 1:numEigenvectors)));
projectionMatrix = projectionMatrix(:, 1:numEigenvectors) ./ scalingFactors';

% Project the original data onto the principal components
reducedData = X * projectionMatrix;
disp(reducedData);

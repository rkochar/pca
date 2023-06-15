%Load image and convert it to a vector
image=imread('lena_gray.png');
figure, imshow(image)
title('Original Image');
[h, w, d]=size(image);
X = double(reshape(image,w*h,d))/255;
numSamples = 420;
numEigenvectors = 1;

% Select random samples and kernel
sampleIndices = randperm(size(X, 1), numSamples);
samples = X(sampleIndices, :);
kernelMatrix = samples * samples';

% Compute eigenvectors (U) and eigenvalues (V)
[V, D] = eig(kernelMatrix);

% Descending sort eigenvectors based on eigenvalues
[~, idx] = sort(diag(D), 'descend');
V = V(:, idx);

% Compute projection and normalize with scaling factors
projectionMatrix = samples' * V;
scalingFactors = sqrt(diag(D(1:numEigenvectors, 1:numEigenvectors)));
projectionMatrix = projectionMatrix(:, 1:numEigenvectors) ./ scalingFactors';

% Project the original data onto the principal components
p1x = X * projectionMatrix;

%convert eigenvector to image and display the image
image =uint8(reshape(p1x,h,w,d)*255);
figure, imshow(image)
title('PCA 2.2 image');
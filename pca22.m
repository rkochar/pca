%Load image and convert it to a vector
image=imread('exampleimage.png');
figure, imshow(image)
title('Original Image');
set(gcf, 'NextPlot', 'new');

[h, w, d]=size(image);
X = double(reshape(image,w*h,d))/255;
numSamples = 420;
numEigenvectors = 3;

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

% Plot residuals
histogram(X - p1x, 10);
title('Histogram of residuals of image 2.2');

%convert eigenvector to image and display the image
image =uint8(reshape(p1x,h,w,d)*255);
figure, imshow(image)
title('PCA 2.2 image');
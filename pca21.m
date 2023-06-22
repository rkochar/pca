%Load image and convert it to a vector
image=imread('exampleimage.png');
figure, imshow(image)
title('Original Image');
set(gcf, 'NextPlot', 'new');

[h, w, d]=size(image);
X = double(reshape(image,w*h,d))/255;

% Set the number of snapshots
numSnapshots = 42;

% Select random snapshots
snapshotIndices = randperm(size(X, 1), numSnapshots);
snapshots = X(snapshotIndices, :);

% Center the snapshots
meanSnapshots = mean(snapshots);
snapshots = snapshots - meanSnapshots;

% Compute covariance matrix of the snapshots
covSnapshots = (snapshots' * snapshots) / (size(snapshots, 1) - 1);

% Compute eigenvectors (V) and eigenvalues (D)
[V, D] = eigs(4);

% Descending sort the eigenvectors by eigenvalues
[~, idx] = sort(diag(D), 'descend');
V = V(:, idx);
em1 = V(:, 1);

%project image onto eigenspace
p1x=X'*em1;

% Plot residuals
histogram(X - p1x', 10);
title('Histogram of residuals of image 2.1')

%convert eigenvector to image and display the image
image =uint8(reshape(p1x,h,w,d)*255);
figure, imshow(image)
title('PCA 2.1 image');
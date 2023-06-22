%Load image and convert it to a vector
image=imread('exampleimage.png');
figure, imshow(image)
title('Original Image');
set(gcf, 'NextPlot', 'new');

[h, w, d]=size(image);
X0 = double(reshape(image,w*h,d)) / 255;

% Center the data by subtracting the mean from each feature
mean_X = mean(X0);
X = X0 - mean_X;

% Compute Gram matrix, eigenvectors (V) and eigenvalues (D) 
% K = X * X';
[V, D] = eigs(4);

% Descending sort the eigenvectors by eigenvalues 
[~, idx] = sort(diag(D), 'descend');
V = V(:, idx);
em1 = V(:, 1);

%project image onto eigenspace
p1x=X'*em1*em1;

resid = X0 - p1x';
histogram(resid, 10);
title('Histogram of residuals of image 1.2');

%convert eigenvector to image and display the image
image =uint8(reshape(p1x,h,w,d) * 255);
figure, imshow(image)
title('PCA 1.2 image');
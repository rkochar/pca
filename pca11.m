%Load image and convert it to a vector
image=imread('exampleimage.png');
figure, imshow(image)
title('Original Image');
[h, w, d]=size(image);
X0 = double(reshape(image,w*h,d))/255;

% Center data
X = X0 - mean(X0);

% Covariance matrix
cov_X = (X' * X) / (size(X, 1) - 1);

% Eigenvector (V) and eigenvalues (D)
[V, D] = eigs(4);

% Descending sort eigenvectors eigenvalues and pick largest
[~, idx] = sort(diag(D), 'descend'); % TODO: optimize this by using max
V = V(:, idx);
em1 = V(:, 1);

%project image onto eigenspace
p1x=X'*em1*em1;

% Plot residuals
resid = X0 - p1x';
histogram(resid);
title('Histogram of residuals of image 1.1')

%convert eigenvector to image and display the image
image =uint8(reshape(p1x,h,w,d)*255);
figure, imshow(image)
title('PCA 1.1 image');
# Assignment C

## Task 1

### Covariance Matrix
- Eigenvectors of the covariance matrix are the principal components and give insights into the linear dependences and variances in the data.
- By ranking the eigenvalues, the eigenvector capturing most information can be easily found
- Sensitive to outliers
- Covariance matrix implicitly assumes linear relationship in data
- Covariance matrix can be expensive to store because of it's size grows with quadratic complexity to size of data.

### Gram Matrix
- Size of gram matrix is square of number of data points. In images, that is usually much smaller than number of features.
- Depends on selecting a good kernel
- Hard to get inference (in covariance, the eigenvectors gave some insights)
- can do non-linear decomposition
- Works best when 

## Task 2
Nystrom method focuses on approximating large covariance or kernel matrices, while the Snapshot method reduces the complexity by operating on a subset of the data. The choice between the two methods depends on the specific requirements of the problem, such as dataset size, available memory, interpretability, and the need for nonlinear dimensionality reduction.

### Snapshot
- fewer computations (subset of data). Faster/less ram needed.
- can depend on luck because unrepresentative subsets can be selected
- preserves structure/characteristics of data in snapshot

### Nystrom
- approximates eigen vectors and values quickly
- handles large datasets very well
- can do non-linear transformations (by selecting appropriate kernel)
- sensitive to data that is sampled (can over-sample but also give incorrect approimations if sample are not representative)
- Even though eigenvectors and values are computed, it can be hard to interpret because it can can capture false non-linear information in it's approximation

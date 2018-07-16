clear ; close all; clc
fprintf('Finding closest centroids.\n\n');

load('ex7data2.mat');
K = 3;
initial_centroids = [3 3; 6 2; 8 5];
idx = findClosestCentroids(X, initial_centroids);
fprintf('Press enter to continue.\n');
pause;

fprintf('\nComputing centroids means.\n\n');
centroids = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');
fprintf('Press enter to continue.\n');
pause;


fprintf('\nRunning K-Means clustering on example dataset.\n\n');
load('ex7data2.mat');
K = 3;
max_iters = 10;
initial_centroids = [3 3; 6 2; 8 5];
[centroids, idx] = runkMeans(X, initial_centroids, max_iters, true);
fprintf('\nK-Means Done.\n\n');

fprintf('Press enter to continue.\n');
pause;

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');
A = double(imread('birdd.jpg'));

A = A / 255; 
img_size = size(A);
X = reshape(A, img_size(1) * img_size(2), 3);
K = 16; 
max_iters = 10;
initial_centroids = kMeansInitCentroids(X, K);
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);

fprintf('Press enter to continue.\n');
pause;

fprintf('\nApplying K-Means to compress an image.\n\n');
idx = findClosestCentroids(X, centroids);
X_recovered = centroids(idx,:);
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
subplot(1, 2, 1);
imagesc(A); 
title('Original');
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));


fprintf(' Press enter to continue.\n');
pause;


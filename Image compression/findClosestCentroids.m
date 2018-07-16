function idx = findClosestCentroids(X, centroids)
K = size(centroids, 1);
idx = zeros(size(X,1), 1);

for i=1:size(X,1)
  minindex=1;
currentmin=inf; 
  for j=1:K
    dist=0;
    for l=1:size(X,2)
      dist=dist+(X(i,l)-centroids(j,l))^2;
    endfor
     if(dist<currentmin)
        currentmin=dist;
        minindex=j;
      endif
  endfor
  idx(i)=minindex;
  endfor
end
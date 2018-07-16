function centroids = computeCentroids(X, idx, K)
[m n] = size(X);
centroids = zeros(K, n);
for j=1:K
sum=zeros(1,n);
counter=0;
  for i=1:m
    if idx(i)==j
      sum=sum+X(i,:);
      counter++;
    endif
  endfor
  centroids(j,:)=sum./counter;
 endfor
  





end


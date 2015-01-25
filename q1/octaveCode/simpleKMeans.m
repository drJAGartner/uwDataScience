% simpleKMeans is a 2D K-means implementation.  
% The function takes points and initial centroids and 
% returns centroids K-mean centroids
function centroids = simpleKMeans(points, centroids)
% test:  centroids = simpleKMeans(simplePoints, [0, 0; -1, 0; 0, 1])
% test:  simpleKMeansTests
% Get ridiculous values for the initial cluster ids
clusterIDOld = -1;

% Parameters for normalization and de-normalization
% Determine the minimum and range of the points in both dimensions
% Missing code:


% Normalize points
% for each dimension for each point subtract away its minimum and then divide by the range
% Missing code:


% Normalize Centroids
% For each dimension and centroid subtract away the minimum of the dimension
% and then divide by the range of the dimension
% Missing code:


% repeat the following processes using a loop.  Use a for loop to prevent infinite loops
for (iter1 = 1:20)
    % For each point find its closest cluster centre (centroid)
    clusterID = simpleAssignToCentroids(points, centroids);
    % If there was no change in cluster assignments, then stop;  Use "break" to break out of the loop
    if (sum(clusterID ~= clusterIDOld) < 1)   
        break;
    end % if
    % For each cluster of points determine its centroid;  The number of clusters is the number of centroids
    centroids = simpleDetermineCentroids(points, clusterID, size(centroids, 1));
    % remember clusterID before clusterID is re-assigned
    clusterIDOld = clusterID;
    % end the for loop
end % for

% Denormalization
% for each dimension for each centroid mutiply by range and then add minimum
% Missing code:


% End the function
return

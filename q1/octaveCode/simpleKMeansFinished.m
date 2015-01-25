% 1 a.) Normalization is important in K means clustering because without normalization,
%       a single dimension whose scale is much larger than others will tend to dominate,
%       and hence you do not properly leverate multiple dimentions.
%   b.) Categorical data becomes integer factors (e.g. "car", "bike", "boat" -> 1, 2, 3)
%   c.) Clustering is considered unsupervised learning because there is not a target
%       result that one hopes to achieve, rather, one inputs parameters randomely and the
%       output is completely determined by the data.

% 2 simpleAssignToCentroids creates a matrix with one row for each point, and one column
%   for each centroid.  In this example, the centroid that corresponds to the column with
%   the lowest value in the 17th row will be the centroid to which the 17th point is assigned.

% 3


% simpleKMeans is a 2D K-means implementation.
% The function takes points and initial centroids and 
% returns centroids K-mean centroids
function centroids = simpleKMeansFinished(points, centroids)
% test:  centroids = simpleKMeansFinished(simplePoints, [0, 0; -1, 0; 0, 1])
% test:  simpleKMeansTests
% Get ridiculous values for the initial cluster ids
clusterIDOld = -1;

% Parameters for normalization and de-normalization
% Determine the minimum and range of the points in both dimensions
warning("off");
vMin   = min(points);
vMax   = max(points);
vRange = vMax - vMin;

% Normalize points
% for each dimension for each point subtract away its minimum and then divide by the range
points = (points.-vMin)./vRange;

% Normalize Centroids
% For each dimension and centroid subtract away the minimum of the dimension
% and then divide by the range of the dimension
centroids = (centroids.-vMin)./vRange;


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
centroids = (centroids.*vRange).+vMin;


% End the function
return

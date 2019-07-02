function [clusters, finalMeans] = KMeansRGB(imageArray, colours, n)
% KMeansRGB.m assigns data points in an image array to clusters and
% calculates new means. This is repeated until the new means are the same
% as the previous means. If this does not happen, it will repeat a
% specified ammount of times
% Inputs:   imageArray = 3D Image Array (RGB format)
%           colours = 3D array of initial colour data
%           n = max number of iterations
% Outputs:  clusters = array of assigned clusters
%          	finalMeans = final RGB means calculated by the KMeansRGB.m
%                        function
% Author: Jack Chamberlain


i = 0; % iteration counter
[k, ~, ~] = size(colours);

% makes lastColours defined for the while loop and not equal to colours
lastColours = zeros(k,1,3);


% repeats while the current means and last means are not equal and it is
% below the max specified iterations
while isequal(colours, lastColours) == 0 && (i<n)
    currentCluster = AssignToClusters(imageArray, colours);
    % stores the colours for comparison with the next colours
    lastColours = colours;
    colours = UpdateMeans(imageArray, k, currentCluster);
    i = i+1; % increases the iteration count
end


if i == n && isequal(colours, lastColours) == 0
    disp(['Maximum number of iterations reached before convergence was achieved']);
end


% stores the final means and clusters from when convergance is reached or
% max iterations is reached
finalMeans = colours;
clusters = currentCluster;
end
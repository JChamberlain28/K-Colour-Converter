function [means] = UpdateMeans(imageArray, k, clusters)
% UpdateMeans.m calculates new mean points from the clusters produced by
% the AssignToClusters.m function.
% Inputs:   imageArray = 3D Image Array (RGB format)
%           k = number specifying ammount of colours
%           clusters = array of assigned clusters
% Outputs:  means = updated k rows, 1 col, 3 layer array of mean RGB points
% Author: Jack Chamberlain


% pre allocates means array
means = zeros(k, 1, 3);

% seperates the red green and blue layers of the 3d image array
layer1 = imageArray(:,:,1);
layer2 = imageArray(:,:,2);
layer3 = imageArray(:,:,3);


for i = 1:k % calculates new mean colours for each of the clusters
    
    % finds all points with the current cluster number in the clsuter array
    clusterIndex = find(clusters==i);
    
    % creates arrays for red, green and blue values for each image poin
    % that belongs to the current cluster
    valuesR = layer1(clusterIndex');
    valuesG = layer2(clusterIndex');
    valuesB = layer3(clusterIndex');
    
    % calculates new means through averaging and assigns them to the means
    % array
    means(i,1,1) = sum(valuesR)/length(valuesR);
    means(i,1,2) = sum(valuesG)/length(valuesG);
    means(i,1,3) = sum(valuesB)/length(valuesB);
end


end